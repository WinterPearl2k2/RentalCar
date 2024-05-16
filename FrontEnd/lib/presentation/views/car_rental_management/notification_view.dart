import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rental_car/application/utils/assets_utils.dart';
import 'package:rental_car/application/utils/date_time_format_untils.dart';
import 'package:rental_car/application/utils/format_utils.dart';
import 'package:rental_car/data/dtos/user_car_rental_dto.dart';
import 'package:rental_car/presentation/common/base_state_delegate/base_state_delegate.dart';
import 'package:rental_car/presentation/views/car_rental_management/widgets/btn_view_sign_widget.dart';
import 'package:rental_car/presentation/views/car_rental_management/widgets/icon_button_notification_widget.dart';
import 'package:rental_car/presentation/views/car_rental_management/widgets/status_widget.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../application/utils/colors_utils.dart';
import '../../common/widgets/loading_widget.dart';
import 'notifier/car_rental_management_notifier.dart';

class CarRentalManagementView extends ConsumerStatefulWidget {
  const CarRentalManagementView({super.key});

  @override
  BaseStateDelegate<CarRentalManagementView, CarRentalManagementNotifier>
      createState() => _NotificationViewState();
}

class _NotificationViewState extends BaseStateDelegate<CarRentalManagementView,
    CarRentalManagementNotifier> with SingleTickerProviderStateMixin {
  @override
  void initNotifier() {
    notifier = ref.read(carRentalManagementNotifierProvider.notifier);
    notifier.getRentalCar();
  }

  final statusStr = [
    'Processing',
    'Active',
    'Canceled',
    'Expired',
  ];
  final statusColors = [
    ColorUtils.yellowColor,
    ColorUtils.greenColor,
    ColorUtils.redColor,
    ColorUtils.blueColor,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            AssetUtils.icBack,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: PopScope(
        onPopInvoked: (didPop) async {
          if (didPop) {
            return;
          }
          Navigator.pop(context);
        },
        canPop: false,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Car Rental Management',
                    style: TextStyle(
                      color: ColorUtils.primaryColor,
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Expanded(
                    child: Consumer(
                      builder: (_, ref, __) {
                        List<UserCarRentalDto> user = ref.watch(
                          carRentalManagementNotifierProvider.select(
                            (value) => value.user,
                          ),
                        );
                        return ListView.builder(
                          itemCount: user.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 5,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorUtils.textColor.withOpacity(.2),
                                    spreadRadius: 3,
                                    blurRadius: 3,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 50.w,
                                        height: 50.h,
                                        decoration: BoxDecoration(
                                          color: ColorUtils.whiteColor,
                                          border: Border.all(
                                            color: ColorUtils.primaryColor,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: SvgPicture.asset(
                                          'assets/images/avatar_empty.svg',
                                        ),
                                      ),
                                      Visibility(
                                        visible: user[index].statusCar == 0,
                                        child: IconButtonNotificationWidget(
                                          onPressed: () {
                                            launchUrlString(
                                              "tel://${user[index].phoneUser}",
                                            );
                                          },
                                          icon: SvgPicture.asset(
                                            'assets/icons/ic_phone.svg',
                                            colorFilter: ColorFilter.mode(
                                              ColorUtils.primaryColor,
                                              BlendMode.srcIn,
                                            ),
                                            height: 15.h,
                                            width: 15.h,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          user[index].nameUser,
                                          style: TextStyle(
                                            color: ColorUtils.primaryColor,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'From: ${DateTimeFormatUtils.convertDateFormat(
                                            format: 'dd/MM/yyyy',
                                            inputDate: user[index].startDate,
                                          )}',
                                          style: TextStyle(
                                            color: ColorUtils.textColor,
                                            fontSize: 12.sp,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(
                                          'To: ${DateTimeFormatUtils.convertDateFormat(
                                            format: 'dd/MM/yyyy',
                                            inputDate: user[index].endDate,
                                          )}',
                                          style: TextStyle(
                                            color: ColorUtils.textColor,
                                            fontSize: 12.sp,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(
                                          'Rental Date: ${user[index].rentalDays}',
                                          style: TextStyle(
                                            color: ColorUtils.textColor,
                                            fontSize: 12.sp,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(
                                          'Rental Fee: ${FormatUtils.formatNumber(
                                            user[index].rentalPrice,
                                          )} VND',
                                          style: TextStyle(
                                            color: ColorUtils.textColor,
                                            fontSize: 12.sp,
                                            overflow: TextOverflow.fade,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        DateTimeFormatUtils.convertDateFormat(
                                          format: 'HH:mm',
                                          inputDate: user[index].createAt,
                                        ),
                                        style: TextStyle(
                                          color: ColorUtils.textColor,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      user[index].statusCar == 0
                                          ? BtnViewSignWidget(
                                              notifier: notifier,
                                              user: user,
                                              index: index,
                                            )
                                          : StatusWidget(
                                              statusStr: statusStr,
                                              user: user,
                                              statusColors: statusColors,
                                              index: index,
                                            ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                final isWaiting = ref.watch(
                  carRentalManagementNotifierProvider.select(
                    (value) => value.wait,
                  ),
                );
                return !isWaiting ? const LoadingWidget() : const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
