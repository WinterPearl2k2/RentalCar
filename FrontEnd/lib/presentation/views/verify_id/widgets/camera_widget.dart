import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../application/utils/colors_utils.dart';
import '../verify_id_state/verify_id_state.dart';

class CameraWidget extends StatelessWidget {
  const CameraWidget({
    super.key,
    required this.type,
    required this.cardImage,
    required this.dataImage,
  });

  final void Function(dynamic file) cardImage;
  final Future<void> Function(dynamic file) dataImage;
  final TypeCard type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CameraCamera(
            resolutionPreset: ResolutionPreset.max,
            cameraSide: CameraSide.front,
            enableZoom: true,
            onFile: (file) async {
              Navigator.pop(context);
              switch (type) {
                case TypeCard.frontCard:
                  dataImage(file);
                  break;
                case TypeCard.backCard:
                  cardImage(file);
                  break;
              }
            },
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(bottom: 20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: Text(
                      'Please keep the ID card image within the frame',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorUtils.primaryColor,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  Container(
                    width: 320.w,
                    height: 200.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorUtils.primaryColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
