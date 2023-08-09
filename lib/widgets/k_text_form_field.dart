import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';

import '../utils/utils.dart';
import 'k_inkwell.dart';

class KTextFormField extends HookConsumerWidget {
  const KTextFormField({
    Key? key,
    this.controller,
    required this.hintText,
    this.textAlign = TextAlign.start,
    this.icon,
    this.readOnly = false,
    this.isLabel = false,
    this.onTap,
    this.prefix,
    this.suffix,
    this.suffixIcon,
    this.validator,
    this.focusNode,
    this.isObscure = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.textInputAction,
    this.maxLines = 1,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 12),
    this.onFieldSubmitted,
  }) : super(key: key);

  final TextEditingController? controller;
  final String hintText;
  final TextAlign textAlign;
  final Widget? icon;
  final bool readOnly, isLabel;
  final VoidCallback? onTap;
  final Widget? prefix, suffix, suffixIcon;
  final String? Function(String?)? validator;
  final bool isObscure;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;
  final int? maxLines;
  final EdgeInsetsGeometry contentPadding;
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hideText = useState(true);
    final border = OutlineInputBorder(
      borderRadius: radius10,
      borderSide: BorderSide(
        color: context.color.secondaryContainer.withOpacity(0.5),
        width: 2.w,
      ),
    );
    return TextFormField(
      obscureText: isObscure ? hideText.value : false,
      controller: controller,
      readOnly: readOnly,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: CustomStyle.textFieldStyle,
      cursorColor: context.color.secondaryContainer,
      cursorWidth: 2.w,
      textAlign: textAlign,
      keyboardType: keyboardType,
      maxLines: maxLines,
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: isLabel ? null : hintText,
        hintStyle: CustomStyle.textFieldHintStyle,
        labelText: isLabel ? hintText : null,
        contentPadding: contentPadding,
        border: border,
        enabledBorder: border,
        focusedBorder: OutlineInputBorder(
          borderRadius: radius10,
          borderSide: BorderSide(
            color: context.color.secondaryContainer,
            width: 2.w,
          ),
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.8),
        prefix: prefix,
        suffix: suffix,
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
