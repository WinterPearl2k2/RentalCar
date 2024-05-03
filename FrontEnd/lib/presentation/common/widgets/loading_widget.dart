import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../application/utils/colors_utils.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: 0,
      child: Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0.r,
        insetPadding: const EdgeInsets.all(0).r,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200.w,
              height: 150.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20).r,
                boxShadow: [
                  BoxShadow(
                    color: ColorUtils.textColor,
                    blurStyle: BlurStyle.outer,
                    blurRadius: 6.r,
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CircularProgressIndicator(
                      color: ColorUtils.primaryColor,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  const Text(
                    'Data is being processed!',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
