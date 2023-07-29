import 'package:flutter/material.dart';

import '../utils/utils.dart';
import 'k_text_form_field.dart';

class KTitledTextFormField extends StatelessWidget {
  const KTitledTextFormField({
    Key? key,
    required this.sectionTitle,
    this.fontSize,
    this.fontWeight,
    this.fontColor,
    this.sectionTitleStyle,
    required this.hintText,
    required TextEditingController controller,
    FocusNode? focus,
    this.textInputAction,
    this.onFieldSubmitted,
    this.validator,
    this.prefix,
    this.suffix,
    this.suffixIcon,
    this.isObscure = false,
    this.isReadOnly = false,
    this.textStyle,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.onEditingComplete,
    this.maxLines,
    this.onSaved,
    this.onTap,
  })  : _controller = controller,
        _focus = focus,
        super(key: key);

  final String hintText;
  final TextStyle? textStyle;
  final TextEditingController _controller;
  final FocusNode? _focus;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final bool isObscure;
  final bool isReadOnly;
  final Widget? prefix, suffix, suffixIcon;
  final TextInputAction? textInputAction;
  final TextInputType keyboardType;
  final Function(String?)? onChanged, onSaved;
  final Function()? onEditingComplete, onTap;
  final String sectionTitle;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? fontColor;
  final int? maxLines;
  final TextStyle? sectionTitleStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingH20,
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          Text(
            sectionTitle,
            style: sectionTitleStyle ??
                context.labelLarge.copyWith(
                  fontSize: fontSize ?? Dimensions.textSize20,
                  fontWeight: fontWeight ?? FontWeight.bold,
                  color: fontColor,
                ),
          ),
          gap10,
          KTextFormField(
            readOnly: isReadOnly,
            hintText: hintText,
            controller: _controller,
            focusNode: _focus,
            isObscure: isObscure,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            prefix: prefix,
            suffix: suffix,
            suffixIcon: suffixIcon,
            onFieldSubmitted: onFieldSubmitted,
            validator: validator,
            onChanged: onChanged,
            onTap: onTap,
            maxLines: maxLines,
          ),
        ],
      ),
    );
  }
}
