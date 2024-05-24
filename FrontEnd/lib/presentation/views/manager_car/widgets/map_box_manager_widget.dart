import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:rental_car/application/routes/routes.dart';
import 'package:rental_car/application/services/preference_service.dart';
import 'package:rental_car/application/utils/assets_utils.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/domain/model/mapbox_location.dart';
import 'package:rental_car/presentation/common/widgets/search_form_field.dart';
import 'package:rental_car/presentation/common/widgets/text_button_widget.dart';
import 'package:rental_car/presentation/views/manager_car/notifier/manager_car_notifier.dart';

class BoxMapManagerWidget extends StatelessWidget {
  const BoxMapManagerWidget({
    super.key,
    required this.latController,
    required this.longController,
    required this.addressController,
    required this.notifier,
    this.onPress,
  });

  final TextEditingController latController;
  final TextEditingController longController;
  final TextEditingController addressController;
  final ManagerCarNotifier notifier;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MapWidget(
          onTapListener: (coordinate) async {
            latController.text = coordinate.x.toString();
            longController.text = coordinate.y.toString();
            notifier.marker(
              latitude: coordinate.x,
              longitude: coordinate.y,
            );
            addressController.text = await notifier.getAddressLocation(
              latitude: coordinate.x,
              longitude: coordinate.y,
            );
          },
          onMapCreated: (controller) => notifier.onMapCreated(
            mapboxMap: controller,
            latitude: double.parse(latController.text),
            longitude: double.parse(longController.text),
          ),
          textureView: true,
          cameraOptions: CameraOptions(
            center: Point(
              coordinates: Position(
                double.parse(longController.text),
                double.parse(latController.text),
              ),
            ).toJson(),
            zoom: 14.0,
          ),
        ),
        Positioned(
          bottom: 20,
          right: 10,
          child: IconButton(
            icon: const Icon(Icons.my_location),
            onPressed: () async {
              final location = PreferenceService.getLocationCurrent();
              notifier.moveToCurrentLocation(
                longitude: location.longitude,
                latitude: location.latitude,
              );
              latController.text = location.latitude.toString();
              longController.text = location.longitude.toString();
              addressController.text = await notifier.getAddressLocation(
                longitude: location.longitude,
                latitude: location.latitude,
              );
              onPress?.call();
            },
          ),
        ),
        Positioned(
          bottom: 20,
          right: 70,
          left: 70,
          child: SizedBox(
            height: 50,
            child: TextButtonWidget(
                colorButton: ColorUtils.blueColor,
                label: 'Set Location',
                onPressed: () {
                  notifier.setLocation(
                    latitude: double.parse(latController.text),
                    longitude: double.parse(longController.text),
                  );
                  onPress?.call();
                }),
          ),
        ),
        Positioned(
          top: 30,
          right: 10,
          left: 10,
          child: SafeArea(
            child: Consumer(
              builder: (context, ref, _) {
                return TypeAheadField<MapboxLocation>(
                  controller: addressController,
                  builder: (context, controller, focusNode) {
                    return SearchFormField(
                      controller: addressController,
                      focusNode: focusNode,
                      prefixIcon: InkWell(
                        onTap: () => Routes.goToPreviousView(context),
                        child: SvgPicture.asset(
                          AssetUtils.icBackSearch,
                          height: 5.h,
                          width: 5.w,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      suffixIcon: InkWell(
                        onTap: () => addressController.clear(),
                        child: SvgPicture.asset(
                          AssetUtils.icClear,
                          height: 5.h,
                          width: 5.w,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    );
                  },
                  itemBuilder: (context, MapboxLocation listAddressPredict) {
                    return ListTile(
                      title: Row(
                        children: [
                          SvgPicture.asset(
                            AssetUtils.icLocation,
                            height: 14.h,
                            width: 14.w,
                            fit: BoxFit.scaleDown,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          SizedBox(
                            width: 250.w,
                            child: Text(
                              listAddressPredict.descriptionLocation,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          SvgPicture.asset(
                            AssetUtils.icArrowLeftTop,
                            height: 14.h,
                            width: 14.w,
                            fit: BoxFit.scaleDown,
                          ),
                        ],
                      ),
                    );
                  },
                  emptyBuilder: (context) => const SizedBox.shrink(),
                  suggestionsCallback: (String place) async {
                    return await notifier.getListAddressPredict(
                        location: place);
                  },
                  onSelected: (MapboxLocation mapboxLocation) async {
                    addressController.text = mapboxLocation.descriptionLocation;
                    final location = await notifier.getLatLongAddress(
                        placeId: mapboxLocation.placeId);
                    latController.text = location.latitude.toString();
                    longController.text = location.longitude.toString();
                    notifier.marker(
                      latitude: double.parse(latController.text),
                      longitude: double.parse(longController.text),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
