import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:rental_car/application/routes/routes.dart';
import 'package:rental_car/application/utils/assets_utils.dart';
import 'package:rental_car/domain/model/mapbox_location.dart';
import 'package:rental_car/presentation/common/widgets/search_form_field.dart';
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
                latitude: coordinate.x, longitude: coordinate.y);
            onPress?.call();
          },
          onMapCreated: notifier.onMapCreated,
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
          resourceOptions: ResourceOptions(
              accessToken:
                  'sk.eyJ1IjoicXVhbnRhdHRzIiwiYSI6ImNsd2cxd2NzdTAwN3QycXJtM21qY3U2Y2IifQ.ztbU0y2xI-sDhHUO0z6xwQ'),
        ),
        // Positioned(
        //   bottom: 20,
        //   right: 10,
        //   child: IconButton(
        //     icon: const Icon(Icons.my_location),
        //     onPressed: () {
        //       notifier.moveToCurrentLocation();
        //       onPress?.call();
        //     },
        //   ),
        // ),
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
                              listAddressPredict.placeName,
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
                  suggestionsCallback: (String place) async {
                    return await notifier.getListAddressPredict(location: place);
                  },
                  onSelected: (MapboxLocation mapboxLocation) {
                    addressController.text = mapboxLocation.placeName;
                    latController.text = mapboxLocation.center.last.toString();
                    longController.text = mapboxLocation.center.first.toString();
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
