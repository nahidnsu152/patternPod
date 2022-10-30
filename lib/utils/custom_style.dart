import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'text_theme_style_x.dart';

extension CustomStyle on BuildContext {
  //? Profile Screen
  TextStyle get profileTitleStyle => titleSmall.copyWith(
        fontSize: 18.sp,
        color: color.onPrimaryContainer,
        fontWeight: FontWeight.bold,
      );
  TextStyle get profileSubTitleStyle => titleSmall.copyWith(
        fontSize: 18.sp,
        color: color.onTertiaryContainer,
        fontWeight: FontWeight.w600,
      );
  TextStyle get textFieldLabelTextStyle => bodyLarge.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      );

  //? Application Info Screen
  TextStyle get speedDialTooltipStyle => titleSmall.copyWith(
        fontWeight: FontWeight.w500,
        color: color.onPrimary,
      );
}
