import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rental_car/application/routes/routes.dart';
import 'package:rental_car/application/utils/assets_utils.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/data/dtos/car_review_dto.dart';
import 'package:rental_car/presentation/common/base_state_delegate/base_state_delegate.dart';
import 'package:rental_car/presentation/common/enum/status.dart';
import 'package:rental_car/presentation/common/widgets/error_custom_widget.dart';
import 'package:rental_car/presentation/common/widgets/loading_widget.dart';
import 'package:rental_car/presentation/common/widgets/text_button_widget.dart';
import 'package:rental_car/presentation/views/car_review/notifier/car_review_notifier.dart';
import 'package:rental_car/presentation/views/car_review/widgets/body_car_review_widget.dart';

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
  final TextEditingController rateController = TextEditingController();

  @override
  void initNotifier() {
    notifier = ref.read(carReviewNotifierProvider.notifier);
    notifier.getCarReview(idCar: widget.idCar);
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
            Consumer(
              builder: (_, ref, __) {
                final status = ref.watch(
                  carReviewNotifierProvider.select((value) => value.status),
                );
                switch (status) {
                  case Status.loading:
                    return Stack(
                      children: [
                        BodyCarReviewWidget(
                            widget: widget,
                            rateController: rateController,
                            commentController: commentController,
                            ref: ref),
                        const LoadingWidget(),
                      ],
                    );
                  case Status.success:
                    return  Stack(
                      children: [
                        BodyCarReviewWidget(
                            widget: widget,
                            rateController: rateController,
                            commentController: commentController,
                            ref: ref),
                      ],
                    );
                  case Status.error:
                    return const ErrorCustomWidget();
                }
              },
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
              },
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
