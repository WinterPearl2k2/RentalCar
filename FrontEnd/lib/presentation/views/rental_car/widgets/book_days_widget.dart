import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../application/utils/colors_utils.dart';
import '../../../common/widgets/text_button_widget.dart';
import '../notifier/rental_car_notifier.dart';
import 'day_ui_widget.dart';
import 'dialog_time_picker_widget.dart';

class BookDaysWidget extends StatelessWidget {
  const BookDaysWidget({
    super.key,
    required this.notifier,
  });

  final RentalCarNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Column(
            children: [
              Consumer(
                builder: (_, ref, __) {
                  final startDay = ref.watch(
                    rentalCarNotifierProvider.select(
                      (value) => value.startDate,
                    ),
                  );
                  return DayUIWidget(
                    title: "Start day",
                    time: startDay,
                  );
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              Consumer(
                builder: (_, ref, __) {
                  final endDay = ref.watch(
                    rentalCarNotifierProvider.select(
                      (value) => value.endDate,
                    ),
                  );
                  return DayUIWidget(
                    title: "End day",
                    time: endDay,
                  );
                },
              ),
            ],
          ),
        ),
        Container(
          width: 1.w,
          height: 80.h,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          color: ColorUtils.textColor,
        ),
        Flexible(
          flex: 1,
          child: SizedBox(
            height: 60.h,
            child: TextButtonWidget(
              label: 'Book day',
              onPressed: () => showDialog(
                context: context,
                builder: (context) => DialogTimePickerWidget(
                  onSubmitted: (start, end) => notifier.bookDay(
                    startDay: start!,
                    endDay: end!,
                  ),
                  onSelectionChanged: notifier.onSelectionChanged,
                  selectableDayPredicate: notifier.selectableDayPredicate,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
