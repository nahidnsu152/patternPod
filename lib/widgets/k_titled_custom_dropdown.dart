import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/utils.dart';

class KTitledCustomDropDown<T> extends StatelessWidget {
  const KTitledCustomDropDown({
    Key? key,
    required this.title,
    this.titleTextStyle,
    this.fontSize,
    this.fontWeight,
    this.fontColor,
    required this.selectedValue,
    required this.list,
    required this.item,
    required this.onChanged,
  }) : super(key: key);

  final String title;
  final TextStyle? titleTextStyle;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? fontColor;
  final ValueNotifier<T?> selectedValue;
  final List<T>? list;
  final DropdownMenuItem<T> Function(T) item;
  final Function(T?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingH20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleTextStyle ??
                context.labelLarge.copyWith(
                  fontSize: fontSize ?? Dimensions.textSize20,
                  fontWeight: fontWeight ?? FontWeight.bold,
                  color: fontColor,
                ),
          ),
          gap10,
          DropdownButtonHideUnderline(
            child: DropdownButton2<T>(
              buttonStyleData: ButtonStyleData(
                padding: paddingRight10,
                elevation: 5,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: radius10,
                  border: Border.all(
                    color: context.color.shadow.withOpacity(.5),
                    width: 2.w,
                  ),
                ),
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: .3.sh,
                useSafeArea: true,
                decoration: BoxDecoration(
                  color: context.color.primary,
                  borderRadius: radius10,
                ),
                elevation: 10,
                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(40),
                  thickness: MaterialStateProperty.all(5),
                  thumbVisibility: MaterialStateProperty.all(true),
                ),
              ),
              isExpanded: true,
              style: CustomStyle.textFieldStyle,
              value: selectedValue.value,
              hint: Text(
                KStrings.pleaseSelectOne,
                style: CustomStyle.textFieldStyle,
              ),
              onChanged: onChanged,
              items: list?.map((e) {
                return item(e);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
