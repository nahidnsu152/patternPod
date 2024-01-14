import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';

import '../utils/utils.dart';
import 'k_inkwell.dart';

class KTextFormField extends HookConsumerWidget {
  const KTextFormField({
    super.key,
    this.controller,
    required this.hintText,
    this.textAlign = TextAlign.start,
    this.icon,
    this.readOnly = false,
    this.isLabel = false,
    this.onTap,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.focusNode,
    this.isObscure = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.textInputAction,
    this.maxLines = 1,
    this.fillColor,
    this.inputBorder,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 12,
    ),
    this.onFieldSubmitted,
  });

  final TextEditingController? controller;
  final String hintText;
  final TextAlign textAlign;
  final Widget? icon;
  final bool readOnly, isLabel;
  final VoidCallback? onTap;
  final Widget? prefix, suffix, prefixIcon, suffixIcon;
  final String? Function(String?)? validator;
  final bool isObscure;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;
  final int? maxLines;
  final EdgeInsetsGeometry contentPadding;
  final void Function(String)? onFieldSubmitted;
  final Color? fillColor;
  final InputBorder? inputBorder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hideText = useState(true);
    final border = UnderlineInputBorder(
      borderRadius: radius10,
      borderSide: const BorderSide(
        color: Colors.black,
      ),
    );
    return TextFormField(
      obscureText: isObscure ? hideText.value : false,
      controller: controller,
      readOnly: readOnly,
      cursorHeight: 20.h,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: CustomStyle.textFieldStyle,
      cursorColor: Colors.black,
      cursorWidth: 2.w,
      textAlign: textAlign,
      keyboardType: keyboardType,
      maxLines: isObscure ? 1 : maxLines,
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: isLabel ? null : hintText,
        hintStyle: CustomStyle.textFieldHintStyle,
        labelText: isLabel ? hintText : null,
        contentPadding: contentPadding,
        border: inputBorder ?? border,
        enabledBorder: inputBorder ?? border,
        focusedBorder: inputBorder ?? border,
        filled: true,
        fillColor: fillColor,
        prefix: prefix,
        suffix: suffix,
        prefixIcon: prefixIcon,
        suffixIcon: isObscure
            ? KInkWell(
                borderRadius: radius24,
                onTap: () {
                  hideText.value = !hideText.value;
                },
                child: hideText.value
                    ? const Icon(EvaIcons.eye_off_2_outline)
                    : const Icon(EvaIcons.eye),
              )
            : suffixIcon,
      ),
      onTap: onTap,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
    );
  }
}
