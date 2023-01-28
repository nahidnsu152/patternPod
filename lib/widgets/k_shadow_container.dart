import 'k_inkwell.dart';
import 'package:flutter/material.dart';

class KShadowContainer extends StatelessWidget {
  const KShadowContainer({
    Key? key,
    required this.child,
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
    this.blurRadius = 10,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.onTap,
    this.height,
    this.width,
    this.backgroundColor,
  }) : super(key: key);

  final double? height;
  final double? width;
  final Widget child;
  final BorderRadius borderRadius;
  final double blurRadius;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.hardEdge,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        boxShadow: [
          // BoxShadow(
          //   color: const Color(0xFF607A94).withOpacity(.8),
          //   blurRadius: 10,
          //   spreadRadius: 0,
          //   offset: const Offset(0, 4),
          // ),
          // const BoxShadow(
          //   color: Colors.white,
          //   blurRadius: 10,
          //   spreadRadius: 4,
          //   offset: Offset(4, 0),
          // ),
          // BoxShadow(
          //   color: const Color(0xFF607A94).withOpacity(.05),
          //   blurRadius: 10,
          //   spreadRadius: 0,
          //   offset: const Offset(1, 0),
          // ),
          // const BoxShadow(
          //   color: Colors.white,
          //   blurRadius: 10,
          //   spreadRadius: 4,
          //   offset: Offset(-4, 0),
          // ),
          // BoxShadow(
          //   color: const Color(0xFF607A94).withOpacity(.05),
          //   blurRadius: 10,
          //   spreadRadius: 0,
          //   offset: const Offset(-1, 0),
          // ),
          // const BoxShadow(
          //   color: Colors.white,
          //   blurRadius: 3,
          //   spreadRadius: 1,
          //   offset: Offset(0, -4),
          // ),
          // BoxShadow(
          //   color: const Color(0xFF607A94).withOpacity(.05),
          //   blurRadius: 10,
          //   spreadRadius: 0,
          //   offset: const Offset(0, -4),
          // ),
          BoxShadow(
            color:
                Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(.2),
            blurRadius: blurRadius,
            spreadRadius: 0,
            offset: const Offset(2, 2),
          ),
          BoxShadow(
            color: Theme.of(context).colorScheme.surface.withOpacity(.2),
            blurRadius: blurRadius,
            spreadRadius: 0,
            offset: const Offset(-2, -2),
          ),
        ],
      ),
      child: KInkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
