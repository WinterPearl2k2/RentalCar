import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../application/utils/colors_utils.dart';
import '../../../common/widgets/text_button_widget.dart';
import '../notifier/rental_car_notifier.dart';

class DialogTimePickerWidget extends StatelessWidget {
  final Function(DateTime? start, DateTime? end)? onSubmitted;
  final bool Function(DateTime dateTime)? selectableDayPredicate;
  final void Function(DateRangePickerSelectionChangedArgs mode)?
      onSelectionChanged;

  DialogTimePickerWidget({
    super.key,
    this.onSubmitted,
    this.selectableDayPredicate,
    this.onSelectionChanged,
  });

  final DateRangePickerController _controller = DateRangePickerController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ColorUtils.whiteColor,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Wrap(
          direction: Axis.horizontal,
          children: [
            Column(
              children: [
                Text(
                  'Select rental dates',
                  style: TextStyle(
                    color: ColorUtils.primaryColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SfDateRangePicker(
                  controller: _controller,
                  minDate: DateTime.now(),
                  backgroundColor: ColorUtils.blueLightColor,
                  startRangeSelectionColor: ColorUtils.primaryColor,
                  endRangeSelectionColor: ColorUtils.primaryColor,
                  rangeSelectionColor:
                      ColorUtils.blueMiddleColor.withOpacity(.5),
                  todayHighlightColor: ColorUtils.blueMiddleColor,
                  selectionColor: ColorUtils.primaryColor,
                  headerStyle: DateRangePickerHeaderStyle(
                    backgroundColor: ColorUtils.primaryColor,
                    textStyle: TextStyle(
                      color: ColorUtils.whiteColor,
                    ),
                  ),
                  selectionMode: DateRangePickerSelectionMode.range,
                  selectableDayPredicate: selectableDayPredicate,
                  onSelectionChanged: onSelectionChanged,
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 40.h,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButtonWidget(
                          label: 'Cancel',
                          colorButton: ColorUtils.whiteColor,
                          textColor: ColorUtils.primaryColor,
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Consumer(
                          builder: (_, ref, __) {
                            final isBlock = ref.watch(
                              rentalCarNotifierProvider.select(
                                    (value) => value.isSelectRental,
                              ),
                            );
                            return TextButtonWidget(
                              label: 'Ok',
                              blockButton: !isBlock,
                              onPressed: () {
                                final startDate =
                                    _controller.selectedRange?.startDate;
                                final endDate = _controller.selectedRange?.endDate;
                                if (startDate == null || endDate == null) {
                                  Fluttertoast.showToast(
                                      msg: 'Please select start and end dates!');
                                  return;
                                }
                                if (onSubmitted != null) {
                                  onSubmitted!(startDate, endDate);
                                }
                                Navigator.pop(context);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
