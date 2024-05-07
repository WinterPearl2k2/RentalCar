import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../application/utils/colors_utils.dart';

class SuccessNotifyWidget extends StatelessWidget {
  final String? title;
  final String? label;
  const SuccessNotifyWidget({super.key, this.title, this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        right: 10,
        left: 10,
        bottom: 10,
      ).r,
      height: 300.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: ColorUtils.primaryColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check,
              color: ColorUtils.whiteColor,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            title ?? '',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            label ?? '',
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10.h,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                (states) => ColorUtils.primaryColor,
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10.0).r, // Đặt border radius là 10
                ),
              ),
            ),
            child: const SizedBox(
              width: double.infinity,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'DONE',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
