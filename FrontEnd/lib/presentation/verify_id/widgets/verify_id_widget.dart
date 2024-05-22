import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/presentation/verify_id/verify_id_notifier/verify_id_notifier.dart';
import 'package:rental_car/presentation/verify_id/verify_id_state/verify_id_state.dart';

import '../../common/widgets/text_button_widget.dart';
import 'item_add_resume_widget.dart';

class VerifyIdWidget extends StatelessWidget {
  const VerifyIdWidget({
    super.key,
    required this.notifier,
    required this.camera,
  });

  final List<CameraDescription> camera;
  final VerifyIdNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Consumer(
                builder: (_, ref, __) {
                  final path = ref.watch(
                    verifyIdNotifierProvider.select(
                      (value) => value.imgFileFront,
                    ),
                  );
                  return ItemAddResumeWidget(
                    url:
                        'https://ekyc.mdcsoftware.com.vn/images/cccd_front.svg',
                    selectCamera: () => notifier.openCamera(
                      context: context,
                      type: TypeCard.frontCard,
                    ),
                    selectGallery: () => notifier.openGallery(
                      TypeCard.frontCard,
                    ),
                    path: path,
                  );
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              Consumer(
                builder: (_, ref, __) {
                  final path = ref.watch(
                    verifyIdNotifierProvider.select(
                      (value) => value.imgFileBack,
                    ),
                  );
                  return ItemAddResumeWidget(
                    url: 'https://ekyc.mdcsoftware.com.vn/images/cccd_back.svg',
                    path: path,
                    selectGallery: () => notifier.openGallery(
                      TypeCard.backCard,
                    ),
                    selectCamera: () => notifier.openCamera(
                      context: context,
                      type: TypeCard.backCard,
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  final pathFront = ref.watch(
                    verifyIdNotifierProvider.select(
                      (value) => value.imgFileFront,
                    ),
                  );
                  final pathBack = ref.watch(
                    verifyIdNotifierProvider.select(
                      (value) => value.imgFileBack,
                    ),
                  );
                  return TextButtonWidget(
                    label: 'Continue',
                    blockButton: pathFront.isEmpty || pathBack.isEmpty,
                    onPressed: () => notifier.changeStateView(
                      VerifyStateView.verifyFace,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
