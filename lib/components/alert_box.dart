import 'package:chinese_expert/helpers/theming/colors.dart';
import 'package:chinese_expert/helpers/theming/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlertBox extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget leftButton;
  final Widget rightButton;

  const AlertBox({
    super.key,
    required this.title,
    required this.body,
    required this.leftButton,
    required this.rightButton,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      backgroundColor: ColorsManager.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //! title
          Container(
            height: 60.h,
            decoration: BoxDecoration(
              color: ColorsManager.cyan,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r),
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStylesManager.white24Bold,
            ),
          ),
          SizedBox(height: 8.h),

          //! body
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: body,
          ),
          SizedBox(height: 18.h),

          //! buttom buttons
          SizedBox(
            width: 328.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                leftButton,
                SizedBox(width: 20.w),
                rightButton,
                SizedBox(width: 8.w),
              ],
            ),
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
