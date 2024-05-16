
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../application/utils/colors_utils.dart';
import '../../../../data/dtos/user_car_rental_dto.dart';
import 'icon_button_notification_widget.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.user, required this.index,
  });

  final List<UserCarRentalDto> user;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}