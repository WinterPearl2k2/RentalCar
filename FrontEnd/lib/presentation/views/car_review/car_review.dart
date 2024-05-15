import 'dart:convert';
import 'package:cached_memory_image/cached_memory_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rental_car/application/routes/routes.dart';
import 'package:rental_car/application/utils/assets_utils.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/data/dtos/car_review_dto.dart';
import 'package:rental_car/presentation/common/base_state_delegate/base_state_delegate.dart';
import 'package:rental_car/presentation/common/widgets/text_button_widget.dart';
import 'package:rental_car/presentation/common/widgets/text_form_field.dart';
import 'package:rental_car/presentation/views/car_review/notifier/car_review_notifier.dart';

class CarReviewView extends ConsumerStatefulWidget {
  const CarReviewView({
    super.key,
    required this.nameCar,
    required this.idCar,
    required this.imgCar,
  });

  final String idCar;
  final String nameCar;
  final String imgCar;

  @override
  BaseStateDelegate<CarReviewView, CarReviewNotifier> createState() =>
      _SearchCarViewState();
}

class _SearchCarViewState
    extends BaseStateDelegate<CarReviewView, CarReviewNotifier> {
  final TextEditingController commentController = TextEditingController();
  final TextEditingController rateController = TextEditingController(text: '3');

  @override
  void initNotifier() {
    notifier = ref.read(carReviewNotifierProvider.notifier);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            AssetUtils.icBack,
          ),
          onPressed: () => Routes.goToPreviousView(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Review',
              style: TextStyle(
                color: ColorUtils.primaryColor,
                fontSize: 26.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Column(
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
                RatingBar.builder(
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
                ),
                SizedBox(
                  height: 15.h,
                ),
                TextFormFieldCustomWidget(
                  hint: 'Tell us about the service',
                  label: "Write review (optional)",
                  maxLines: 8,
                  inputAction: TextInputAction.next,
                  controller: commentController,
                ),
              ],
            ),
            const Spacer(),
            TextButtonWidget(
              onPressed: () {
                notifier.createCarReview(
                  carReviewDTO: CarReviewDTO(
                    idCar: widget.idCar,
                    commentReview: commentController.text,
                    rateReview: double.tryParse(rateController.text) ?? 3,
                  ),
                );
                Routes.goToPreviousView(context);
              } ,
              label: 'Send',
            ),
            SizedBox(
              height: 12.h,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    commentController.dispose();
    rateController.dispose();
    super.dispose();
  }
}
