import 'dart:typed_data';
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
import 'package:rental_car/application/utils/popup_utils.dart';
import 'package:rental_car/domain/model/location.dart';
import 'package:rental_car/presentation/common/widgets/search_form_field.dart';
import 'package:rental_car/presentation/views/home/notifier/home_notifier.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'dart:convert';

class HeaderHomeWidget extends StatefulWidget {
  const HeaderHomeWidget({
    Key? key,
    required this.notifier,
  }) : super(key: key);

  final HomeNotifier notifier;

  @override
  State<HeaderHomeWidget> createState() => _HeaderHomeWidgetState();
}

class _HeaderHomeWidgetState extends State<HeaderHomeWidget> {
  MapboxMap? mapboxMap;
  late Location location;
  late TextEditingController latController;
  late TextEditingController longController;
  PointAnnotation? currentMarker;
  PointAnnotationManager? pointAnnotationManager;
  String currentAddress = "Loading...";
  String currentAddressPredict = "";
  final apiKey =
      'sk.eyJ1IjoicXVhbnRhdHRzIiwiYSI6ImNsd2cxd2NzdTAwN3QycXJtM21qY3U2Y2IifQ.ztbU0y2xI-sDhHUO0z6xwQ';

  @override
  void initState() {
    super.initState();
    location = PreferenceService.getLocation();
    latController = TextEditingController(text: location.latitude.toString());
    longController = TextEditingController(text: location.longitude.toString());
    getAddress(location.latitude, location.longitude);
  }

  @override
  void dispose() {
    latController.dispose();
    longController.dispose();
    super.dispose();
  }

  Future<void> getAddress(double latitude, double longitude) async {
    final url =
        'https://api.mapbox.com/geocoding/v5/mapbox.places/$longitude,$latitude.json?access_token=$apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        currentAddress = data['features'][0]['place_name'];
      });
    } else {
      setState(() {
        currentAddress = 'Failed to get address';
      });
    }
  }

  void _onMapCreated(MapboxMap mapboxMap) {
    this.mapboxMap = mapboxMap;
    initMarker(location.latitude, location.longitude);
  }

  Future<void> initMarker(double latitude, double longitude) async {
    final ByteData bytes =
        await rootBundle.load(AssetUtils.imgLocation);
    final Uint8List list = bytes.buffer.asUint8List();
    pointAnnotationManager =
        await mapboxMap?.annotations.createPointAnnotationManager();
    final options = PointAnnotationOptions(
      geometry: Point(coordinates: Position(longitude, latitude)).toJson(),
      image: list,
    );
    currentMarker = await pointAnnotationManager?.create(options);
  }

  Future<void> marker(double latitude, double longitude) async {
    final ByteData bytes =
        await rootBundle.load(AssetUtils.imgLocation);
    final Uint8List list = bytes.buffer.asUint8List();
    final options = PointAnnotationOptions(
      geometry: Point(coordinates: Position(longitude, latitude)).toJson(),
      image: list,
    );

    if (currentMarker != null) {
      pointAnnotationManager?.delete(currentMarker!);
    }
    mapboxMap?.setCamera(
      CameraOptions(
        center: Point(
          coordinates: Position(
            double.parse(longController.text),
            double.parse(latController.text),
          ),
        ).toJson(),
        zoom: 14.0,
      ),
    );
    currentMarker = await pointAnnotationManager?.create(options);
    getAddress(latitude, longitude);
  }

  void _moveToCurrentLocation() {
    latController.text = location.latitude.toString();
    longController.text = location.longitude.toString();
    mapboxMap?.setCamera(
      CameraOptions(
        center: Point(
          coordinates: Position(
            double.parse(longController.text),
            double.parse(latController.text),
          ),
        ).toJson(),
        zoom: 14.0,
      ),
    );
    marker(location.latitude, location.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.0.w, vertical: 10.0.h),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Your location",
                    style: TextStyle(
                      color: ColorUtils.textColor,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  GestureDetector(
                    onTap: () => PopupUtils.showBottomSheetDialog(
                      context: context,
                      dialog: Stack(
                        children: [
                          MapWidget(
                            onTapListener: (coordinate) {
                              latController.text = coordinate.x.toString();
                              longController.text = coordinate.y.toString();
                              marker(coordinate.x, coordinate.y);
                            },
                            onMapCreated: _onMapCreated,
                            textureView: true,
                            resourceOptions: ResourceOptions(
                              accessToken: apiKey,
                            ),
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
                              onPressed: _moveToCurrentLocation,
                            ),
                          ),
                          Positioned(
                            top: 30,
                            right: 10,
                            left: 10,
                            child: TypeAheadField<String>(
                              builder: (context, controller, focusNode) {
                                return SearchFormField(
                                  controller: controller,
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
                                    onTap: () => controller.clear(),
                                    child: SvgPicture.asset(
                                      AssetUtils.icClear,
                                      height: 5.h,
                                      width: 5.w,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                );
                              },
                              itemBuilder: (context, String suggestion) {
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
                                          suggestion,
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
                                final url =
                                    'https://api.mapbox.com/geocoding/v5/mapbox.places/$place.json?access_token=$apiKey&autocomplete=true&language=vi&limit=10';
                                final response = await http.get(Uri.parse(url));
                                if (response.statusCode == 200) {
                                  final data = jsonDecode(response.body);
                                  List<String> suggestions = [];
                                  for (var feature in data['features']) {
                                    suggestions.add(feature['place_name']);
                                  }
                                  return suggestions;
                                } else {
                                  throw Exception('Failed to get address suggestions');
                                }
                              },
                              onSelected: (String value) {
                                final controller = TextEditingController(text: value);
                                controller.selection = TextSelection.fromPosition(
                                  TextPosition(offset: controller.text.length),
                                );
                                controller.value = controller.value.copyWith(
                                  text: value,
                                  selection: TextSelection.collapsed(offset: value.length),
                                );
                              },
                            ),

                          ),
                        ],
                      ),
                    ),
                    child: SvgPicture.asset(
                      colorFilter: ColorFilter.mode(
                        ColorUtils.textColor,
                        BlendMode.srcIn,
                      ),
                      AssetUtils.icArrowDown,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Consumer(builder: (_, ref, __) {
                final nameLocation = ref.watch(
                  homeNotifierProvider.select((value) => value.nameLocation),
                );
                return SizedBox(
                  width: 250.w,
                  child: Text(
                    currentAddress,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: ColorUtils.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                );
              })
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => Routes.goToSearchCarView(context),
            child: SvgPicture.asset(
              AssetUtils.icSearch,
              width: 22.w,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          GestureDetector(
            onTap: () => {
              Routes.goToCarRentalManagementView(context),
              widget.notifier.resetNumberNotification(),
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  AssetUtils.icNotification,
                  width: 22.w,
                ),
                // Uncomment this part if you want to show notification count
                // Consumer(
                //   builder: (_, ref, __) {
                //     final count = ref.watch(
                //       homeNotifierProvider.select(
                //         (value) => value.numberNewNotification,
                //       ),
                //     );
                //     return Visibility(
                //       visible: count != 0,
                //       child: Positioned(
                //         left: 9.w,
                //         top: 3.h,
                //         child: Container(
                //           padding: const EdgeInsets.all(3),
                //           decoration: BoxDecoration(
                //             color: ColorUtils.redColor,
                //             shape: BoxShape.circle,
                //           ),
                //           child: Text(
                //             count.toString(),
                //             style: TextStyle(
                //               color: ColorUtils.whiteColor,
                //             ),
                //           ),
                //         ),
                //       ),
                //     );
                //   },
                // ),
              ],
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
        ],
      ),
    );
  }
}
