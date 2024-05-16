import 'dart:convert';

import 'package:cached_memory_image/cached_memory_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rental_car/application/utils/assets_utils.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/presentation/common/widgets/text_form_field.dart';
import 'package:rental_car/presentation/views/car_review/car_review_view.dart';
import 'package:rental_car/presentation/views/car_review/notifier/car_review_notifier.dart';

class BodyCarReviewWidget extends StatelessWidget {
  const BodyCarReviewWidget({
    super.key,
    required this.widget,
    required this.rateController,
    required this.commentController,
    required this.ref,
  });

  final CarReviewView widget;
  final TextEditingController rateController;
  final TextEditingController commentController;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedMemoryImage(
            uniqueKey: widget.imgCar,
            bytes: const Base64Decoder().convert(widget.imgCar),
            fit: BoxFit.cover,
            height: 100.h,
            width: 100.w,
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          widget.nameCar,
          style: TextStyle(
            color: ColorUtils.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Consumer(
          builder: (__, ref, _) {
            rateController.text =
                ref.watch(carReviewNotifierProvider).carReview.rateReview.toString();
            return RatingBar.builder(
              initialRating: double.parse(rateController.text),
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => SvgPicture.asset(
                colorFilter: ColorFilter.mode(
                  ColorUtils.yellowColor,
                  BlendMode.srcIn,
                ),
                AssetUtils.icStar,
              ),
              onRatingUpdate: (double rating) {
                rateController.text = rating.toString();
              },
            );
          },
        ),
        SizedBox(
          height: 15.h,
        ),
        Consumer(
          builder: (_, __, ___) {
            commentController.text =
                ref.watch(carReviewNotifierProvider).carReview.commentReview;
            return TextFormFieldCustomWidget(
              hint: 'Tell us about the service',
              label: "Write review (optional)",
              maxLines: 8,
              inputAction: TextInputAction.next,
              controller: commentController,
            );
          },
        ),
      ],
    );
  }
}