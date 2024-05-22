
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/presentation/common/widgets/text_button_widget.dart';
import 'package:rental_car/presentation/verify_id/verify_id_notifier/verify_id_notifier.dart';

import '../../../application/utils/colors_utils.dart';
import 'circle_painter_widget.dart';

class VerifyFaceWidget extends StatefulWidget {
  const VerifyFaceWidget({
    super.key,
    required this.notifier,
    required this.camera,
  });

  final List<CameraDescription> camera;
  final VerifyIdNotifier notifier;

  @override
  State<VerifyFaceWidget> createState() => _VerifyFaceWidgetState();
}

class _VerifyFaceWidgetState extends State<VerifyFaceWidget> {
  late final CameraController _controller = CameraController(
    widget.camera[1],
    ResolutionPreset.max,
  );

  @override
  void initState() {
    super.initState();
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CameraPreview(_controller),
        CustomPaint(
          size: const Size(
            double.infinity,
            double.infinity,
          ),
          painter: CirclePainter(),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Text(
                'Please ensure your face is within the circle.',
                style: TextStyle(
                  color: ColorUtils.primaryColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.fade,
                ),
              ),
              Container(
                height: 80.h,
                padding: const EdgeInsets.all(20),
                child: TextButtonWidget(
                  label: 'Verify',
                  onPressed: () => widget.notifier.handleVerifyFace(
                    _controller,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
