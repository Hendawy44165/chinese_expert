import 'package:chinese_expert/helpers/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconsManager {
  static Icon trash = Icon(Icons.delete, size: 40.r, color: ColorsManager.red);
  static Icon add = Icon(Icons.add, size: 40.r, color: ColorsManager.lightCyan);
  static Icon edit = Icon(Icons.edit, size: 40.r, color: ColorsManager.cyan);
  static Icon prev =
      Icon(Icons.arrow_back_ios, size: 24.r, color: ColorsManager.cyan);
  static Icon next =
      Icon(Icons.arrow_forward_ios, size: 24.r, color: ColorsManager.cyan);
  static Icon back =
      Icon(Icons.arrow_back, size: 24.r, color: ColorsManager.white);

  IconsManager._internal();
}
