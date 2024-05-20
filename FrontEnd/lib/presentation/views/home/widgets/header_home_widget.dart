import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:rental_car/application/routes/routes.dart';
import 'package:rental_car/application/services/preference_service.dart';
import 'package:rental_car/application/utils/assets_utils.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/application/utils/popup_utils.dart';
import 'package:rental_car/presentation/views/home/notifier/home_notifier.dart';

class HeaderHomeWidget extends StatelessWidget {
  const HeaderHomeWidget({
    super.key,
    required this.notifier,
  });

  final HomeNotifier notifier;

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
                      dialog: OpenStreetMapSearchAndPick(
                        buttonTextStyle: const TextStyle(
                            fontSize: 18, fontStyle: FontStyle.normal),
                        buttonColor: ColorUtils.primaryColor,
                        locationPinIconColor: Colors.redAccent,
                        buttonText: 'Set Current Location',
                        onPicked: (pickedData) {
                          PreferenceService.setLocation(
                              latCar: pickedData.latLong.latitude,
                              longCar: pickedData.latLong.longitude);
                          notifier.getListCarNewAddress();
                          notifier.setNameLocation(nameLocation: pickedData.addressName);
                        },
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
                    nameLocation,
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
              notifier.resetNumberNotification(),
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  AssetUtils.icNotification,
                  width: 22.w,
                ),
                Positioned(
                  left: 9.w,
                  top: 3.h,
                  child: Consumer(
                    builder: (_, ref, __) {
                      final count = ref.watch(
                        homeNotifierProvider.select(
                          (value) => value.numberNewNotification,
                        ),
                      );
                      return Visibility(
                        visible: count != 0,
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: ColorUtils.redColor,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            count.toString(),
                            style: TextStyle(
                              color: ColorUtils.whiteColor,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
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
