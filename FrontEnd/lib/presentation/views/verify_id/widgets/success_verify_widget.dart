import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rental_car/presentation/common/widgets/text_button_widget.dart';
import 'package:rental_car/presentation/views/verify_id/widgets/text_information_widget.dart';

import '../../../../application/utils/colors_utils.dart';
import '../verify_id_notifier/verify_id_notifier.dart';
class VerifySuccessWidget extends StatelessWidget {
  const VerifySuccessWidget({
    super.key,
    required this.notifier,
  });

  final VerifyIdNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Consumer(
            builder: (_, ref, __) {
              final faceMemory = ref.watch(
                verifyIdNotifierProvider.select(
                  (value) => value.faceMemory,
                ),
              );
              final avatar = Uint8List.fromList(faceMemory);
              return Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 50.0,
                      child: ClipOval(
                        child: Image.memory(avatar),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: ColorUtils.greenColor,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/ic_security.svg',
                          width: 20.w,
                          height: 20.w,
                          colorFilter: ColorFilter.mode(
                            ColorUtils.whiteColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          Consumer(
            builder: (_, ref, __) {
              final citizen = ref.watch(
                verifyIdNotifierProvider.select(
                  (value) => value.citizen,
                ),
              );
              return Column(
                children: [
                  TextInformationWidget(
                    label: "Citizen ID Number:",
                    title: citizen.no,
                  ),
                  TextInformationWidget(
                    label: "Fullname:",
                    title: citizen.fullName,
                  ),
                  TextInformationWidget(
                    label: "Date of birth:",
                    title: citizen.dateOfBirth,
                  ),
                  TextInformationWidget(
                    label: "Sex:",
                    title: citizen.sex,
                  ),
                  TextInformationWidget(
                    label: "Place:",
                    title: citizen.placeOfOrigin,
                  ),
                  TextInformationWidget(
                    label: "Nationality:",
                    title: citizen.nationality,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 40.h,
                    child: TextButtonWidget(
                      label: "Save information",
                      onPressed: () => notifier.updateInformation(context),
                    ),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
