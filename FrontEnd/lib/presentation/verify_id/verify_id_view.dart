import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rental_car/presentation/common/base_state_delegate/base_state_delegate.dart';
import 'package:rental_car/presentation/verify_id/verify_id_notifier/verify_id_notifier.dart';
import 'package:rental_car/presentation/verify_id/verify_id_state/verify_id_state.dart';
import 'package:rental_car/presentation/verify_id/widgets/success_verify_widget.dart';
import 'package:rental_car/presentation/verify_id/widgets/verify_face_widget.dart';
import 'package:rental_car/presentation/verify_id/widgets/verify_id_widget.dart';

import '../../main.dart';
import '../common/widgets/loading_widget.dart';

class VerifyIdView extends ConsumerStatefulWidget {
  const VerifyIdView({super.key});

  @override
  BaseStateDelegate<VerifyIdView, VerifyIdNotifier> createState() =>
      _CameraState();
}

class _CameraState extends BaseStateDelegate<VerifyIdView, VerifyIdNotifier> {
  late CameraController controller =
      CameraController(cameras[0], ResolutionPreset.max);

  @override
  void initNotifier() {
    notifier = ref.read(verifyIdNotifierProvider.notifier);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verification'),
      ),
      body: Stack(
        children: [
          Consumer(
            builder: (_, ref, __) {
              final stateView = ref.watch(
                verifyIdNotifierProvider.select(
                  (value) => value.stateView,
                ),
              );
              switch (stateView) {
                case VerifyStateView.verifyId:
                  return VerifyIdWidget(
                    notifier: notifier,
                    camera: cameras,
                  );
                case VerifyStateView.verifyFace:
                  return VerifyFaceWidget(
                    notifier: notifier,
                    camera: cameras,
                  );
                case VerifyStateView.verifySuccess:
                  return VerifySuccessWidget(
                    notifier: notifier,
                  );
              }
            },
          ),
          Consumer(
            builder: (_, ref, __) {
              final isWaiting = ref.watch(
                verifyIdNotifierProvider.select(
                      (value) => value.wait,
                ),
              );
              return isWaiting
                  ? const LoadingWidget()
                  : const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
