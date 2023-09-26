import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utils/utils.dart';
import 'k_text_form_field.dart';

class KTitledTextFormField extends HookConsumerWidget {
  const KTitledTextFormField({
    Key? key,
    required this.sectionTitle,
    this.fontSize,
    this.fontWeight,
    this.fontColor,
    this.sectionTitleStyle,
    this.hintText,
    required TextEditingController controller,
    FocusNode? focus,
    this.textInputAction,
    this.onFieldSubmitted,
    this.validator,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.isObscure = false,
    this.isReadOnly = false,
    this.textStyle,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.onEditingComplete,
    this.maxLines,
    this.onSaved,
    this.fillColor,
    this.inputBorder,
    this.onTap,
  })  : _controller = controller,
        _focus = focus,
        super(key: key);

  final String? hintText;
  final TextStyle? textStyle;
  final TextEditingController _controller;
  final FocusNode? _focus;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final bool isObscure;
  final bool isReadOnly;
  final Widget? prefix, suffix, prefixIcon, suffixIcon;
  final TextInputAction? textInputAction;
  final TextInputType keyboardType;
  final Function(String?)? onChanged, onSaved;
  final Function()? onEditingComplete, onTap;
  final String sectionTitle;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? fontColor, fillColor;
  final int? maxLines;
  final TextStyle? sectionTitleStyle;
  final InputBorder? inputBorder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        Text(
          sectionTitle,
          style: sectionTitleStyle ??
              TextStyle(
                fontSize: fontSize ?? Dimensions.textSize20,
                fontWeight: fontWeight ?? FontWeight.bold,
                color: fontColor,
              ),
        ),
        gap4,
        KTextFormField(
          readOnly: isReadOnly,
          hintText: hintText ?? "",
          controller: _controller,
          focusNode: _focus,
          isObscure: isObscure,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          prefix: prefix,
          suffix: suffix,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          onFieldSubmitted: onFieldSubmitted,
          validator: validator,
          onChanged: onChanged,
          onTap: onTap,
          maxLines: maxLines,
          fillColor: fillColor,
          inputBorder: inputBorder,
        ),
      ],
    );
  }
}
