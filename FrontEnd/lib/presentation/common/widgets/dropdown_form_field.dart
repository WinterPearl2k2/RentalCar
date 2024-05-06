import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../application/utils/colors_utils.dart';

class DropdownFormFieldCustomWidget<T> extends StatelessWidget {
  final String? hint;
  final String? label;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final Function(T? value)? onChanged;
  final Widget? error;

  const DropdownFormFieldCustomWidget({
    super.key,
    this.hint,
    this.label,
    this.value,
    required this.items,
    this.onChanged,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label ?? '',
          style: TextStyle(
            color: ColorUtils.primaryColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        DropdownButtonFormField<T>(
          value: value,
          items: items,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hint,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 15.h,
            ),
            hintStyle: TextStyle(
              color: ColorUtils.textColor,
              fontSize: 14.sp,
            ),
            error: error,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Colors.redAccent,
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Colors.redAccent,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: ColorUtils.primaryColor,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: ColorUtils.blueLightColor,
                width: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
