import 'package:flutter/material.dart';

import '../../utils/text_theme_style_x.dart';

class KInkWell extends StatelessWidget {
  const KInkWell(
      {super.key,
      required this.child,
      this.onTap,
      this.borderRadius,
      this.radius,
      this.rippleColor,
      this.backgroundColor});

  final VoidCallback? onTap;
  final Widget child;
  final BorderRadius? borderRadius;
  final double? radius;
  final Color? rippleColor, backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        radius: radius,
        highlightColor: context.color.onPrimaryContainer.withOpacity(.1),
        splashColor: rippleColor?.withOpacity(.12) ??
            context.color.onPrimaryContainer.withOpacity(.12),
        child: child,
      ),
    );
  }
}

class KCircleInkWell extends StatelessWidget {
  const KCircleInkWell(
      {super.key,
      required this.child,
      this.onTap,
      this.rippleColor,
      this.padding,
      this.backgroundColor});

  final VoidCallback? onTap;
  final Widget child;
  final Color? rippleColor, backgroundColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Material(
        color: backgroundColor ?? Colors.transparent,
        shape: const CircleBorder(),
        child: InkWell(
          splashColor: rippleColor?.withOpacity(.12) ??
              context.color.onPrimaryContainer.withOpacity(.12),
          onTap: onTap,
          customBorder: const CircleBorder(),
          child: Ink(
            decoration: const BoxDecoration(shape: BoxShape.circle),
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}
