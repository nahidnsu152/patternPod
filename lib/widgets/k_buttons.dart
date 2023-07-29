import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utils/utils.dart';
import 'widgets.dart';

class KElevatedButton extends HookConsumerWidget {
  const KElevatedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.foregroundColor,
    this.loading,
  }) : super(key: key);

  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final VoidCallback? onPressed;
  final bool? loading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: foregroundColor ?? context.color.shadow,
        backgroundColor: backgroundColor ?? context.color.secondary,
        minimumSize: Size.fromHeight(48.h),
      ),
      onPressed: onPressed,
      child: (loading != null && loading!)
          ? SizedBox(
              height: 30.h,
              width: 30.h,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  foregroundColor ?? context.color.secondary,
                ),
              ),
            )
          : Text(
              text,
              style: context.button.copyWith(
                color: foregroundColor ?? context.color.primaryContainer,
                fontWeight: FontWeight.w800,
                fontSize: Dimensions.defaultTextSize,
              ),
            ),
    );
  }
}

class KOutlinedButton extends HookConsumerWidget {
  const KOutlinedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.foregroundColor,
    this.loading,
  }) : super(key: key);

  final String text;

  final Color? backgroundColor;
  final Color? foregroundColor;
  final VoidCallback onPressed;
  final ValueNotifier<bool>? loading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return KInkWell(
      onTap: () {},
      child: OutlinedButton(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size.fromHeight(55.h)),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          foregroundColor: MaterialStateProperty.all(foregroundColor),
        ),
        onPressed: onPressed,
        child: (loading != null && loading!.value)
            ? SizedBox(
                height: 30.h,
                width: 30.h,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    foregroundColor ?? Theme.of(context).colorScheme.secondary,
                  ),
                ),
              )
            : Text(
                text,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: foregroundColor ??
                          Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
              ),
      ),
    );
  }
}

class KTextButton extends StatelessWidget {
  const KTextButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.borderRadius = BorderRadius.zero,
    this.padding = EdgeInsets.zero,
    this.style,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onPressed;
  final BorderRadiusGeometry borderRadius;
  final EdgeInsetsGeometry? padding;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(padding),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
