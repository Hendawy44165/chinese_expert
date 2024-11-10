import 'package:chinese_expert/helpers/theming/colors.dart';
import 'package:chinese_expert/helpers/theming/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.value,
    required this.onPressed,
    required this.color,
  });

  final String value;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        backgroundColor: ColorsManager.gray,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1000.r),
          side: BorderSide(color: color),
        ),
      ),
      child: Text(value, style: TextStylesManager.color18Bold(color)),
    );
  }
}
