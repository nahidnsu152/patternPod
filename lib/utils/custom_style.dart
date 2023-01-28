import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'text_theme_style_x.dart';

extension CustomStyle on BuildContext {
  //? Profile Screen
  TextStyle get titleStyle => titleSmall.copyWith(
        fontSize: 18.sp,
        color: color.onPrimaryContainer,
        fontWeight: FontWeight.bold,
      );
}
