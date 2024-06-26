
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/application/utils/assets_utils.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/application/utils/popup_utils.dart';
import 'package:rental_car/presentation/views/manager_car/notifier/manager_car_notifier.dart';

class AddCarStep4Widget extends StatelessWidget {
  const AddCarStep4Widget({super.key, required this.notifier});

  final ManagerCarNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Car Image',
            style: TextStyle(
              color: ColorUtils.primaryColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.h),
          CarImageTextFormFieldWidget(notifier: notifier),
        ],
      ),
    );
  }
}

class CarImageTextFormFieldWidget extends StatelessWidget {
  const CarImageTextFormFieldWidget({
    super.key,
    required this.notifier,
  });

  final ManagerCarNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        final imageFile = ref.watch(
          managerCarNotifierProvider.select((value) => value.imageFile),
        ); final isLoading = ref.watch(
          managerCarNotifierProvider.select((value) => value.isLoadingImg),
        );

        return GestureDetector(
          onTap: () async => PopupUtils.showBottomSheetAddImageDialog(
            context: context,
            onSelectPressedCamera: notifier.pickImageFromCamera,
            onSelectPressedGallery: notifier.pickImageFromGallery,
          ),
          child: Container(
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: ColorUtils.textColor),
            ),
            child: isLoading
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : imageFile.isNotEmpty
                ? ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: imageFile,
                progressIndicatorBuilder: (_, __, downloadProgress) =>
                    Image.asset(
                      AssetUtils.imgLoading,
                      fit: BoxFit.cover,
                    ),
                errorWidget: (_, __, error) => const Icon(Icons.error),
              ),
            )
                : const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
