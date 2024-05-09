import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/presentation/common/widgets/text_button_outline_widget.dart';
import 'package:rental_car/presentation/common/widgets/text_button_widget.dart';

class PopupUtils {
  PopupUtils._();

  static void showPopup(
    BuildContext context, {
    required String icon,
    required String title,
    String? message,
    Widget? action,
    String? messageBetween,
    VoidCallback? onTap,
    bool outsideClose = true,
  }) {
    showDialog(
      barrierDismissible: outsideClose,
      context: context,
      builder: (_) {
        return GestureDetector(
          child: Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.all(24.r),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.h,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    icon,
                    width: 48.w,
                    height: 48.h,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: ColorUtils.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Divider(
                    color: ColorUtils.textColor,
                    height: 36.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50.h,
                          child: TextButtonWidget(
                            onPressed: onTap,
                            label: "Xóa",
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 50.h,
                          child: TextButtonOutlineWidget(
                            onPressed: () => Navigator.pop(context),
                            label: "Hủy",
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
