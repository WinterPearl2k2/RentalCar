import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rental_car/application/utils/date_time_format_untils.dart';
import 'package:rental_car/application/utils/format_utils.dart';
import 'package:rental_car/data/dtos/user_car_rental_dto.dart';
import 'package:rental_car/presentation/common/base_state_delegate/base_state_delegate.dart';
import 'package:rental_car/presentation/views/notification/notifier/notification_notifier.dart';
import 'package:rental_car/presentation/views/notification/widgets/icon_button_notification_widget.dart';
import 'package:rental_car/presentation/views/notification/widgets/text_button_notification_widget.dart';
import '../../../application/utils/colors_utils.dart';
import '../../common/widgets/loading_widget.dart';

class NotificationView extends ConsumerStatefulWidget {
  const NotificationView({super.key});

  @override
  BaseStateDelegate<NotificationView, NotificationNotifier> createState() =>
      _NotificationViewState();
}

class _NotificationViewState
    extends BaseStateDelegate<NotificationView, NotificationNotifier>
    with SingleTickerProviderStateMixin {
  @override
  void initNotifier() {
    notifier = ref.read(notificationNotifierProvider.notifier);
    notifier.getRentalCar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/ic_arrow_back.svg',
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
                    'Car Rental Notification',
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
                          notificationNotifierProvider.select(
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
                                      IconButtonNotificationWidget(
                                          onPressed: () {},
                                          icon: SvgPicture.asset(
                                            'assets/icons/ic_phone.svg',
                                            colorFilter: ColorFilter.mode(
                                              ColorUtils.primaryColor,
                                              BlendMode.srcIn,
                                            ),
                                            height: 15.h,
                                            width: 15.h,
                                          )),
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
                                      TextButtonNotificationWidget(
                                        label: 'Sign contract',
                                        onPressed: () {},
                                        backgroundColor:
                                            ColorUtils.primaryColor,
                                        textColor: ColorUtils.whiteColor,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      TextButtonNotificationWidget(
                                        label: 'Cancel',
                                        onPressed: () {},
                                        backgroundColor: Colors.redAccent,
                                        textColor: ColorUtils.whiteColor,
                                      ),
                                    ],
                                  )
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
                  notificationNotifierProvider.select(
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
