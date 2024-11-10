import 'package:chinese_expert/helpers/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageCircle extends StatelessWidget {
  const ImageCircle({
    super.key,
    required this.radius,
    required this.image,
    this.borderWidth = 2,
  });

  final double radius;
  final Widget image;
  final int borderWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (radius * 2).w,
      height: (radius * 2).h,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: ColorsManager.gray,
      ),
      alignment: Alignment.center,
      child: SizedBox(
        width: (radius * 1.6).w,
        height: (radius * 1.6).h,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(1000.r),
        ),
      ),
    );
  }
}
