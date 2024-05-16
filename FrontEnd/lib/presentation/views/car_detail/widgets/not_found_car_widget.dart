import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/application/routes/routes.dart';
import 'package:rental_car/application/utils/assets_utils.dart';
import 'package:rental_car/application/utils/colors_utils.dart';

class NotFoundCarWidget extends StatelessWidget {
  const NotFoundCarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () =>
                    Routes.goToPreviousView(context),
                icon: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 220.h,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Image.asset(
              AssetUtils.imgLoading,
              height: 120.h,
              width: 200.w,
              fit: BoxFit.cover,
            ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "This vehicle has now been deleted or hidden!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorUtils.primaryColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                GestureDetector(
                  onTap: () => Routes.goToPreviousView(context),
                  child: Text(
                    "Choose another car.",
                    style: TextStyle(
                      color: ColorUtils.textColor,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}