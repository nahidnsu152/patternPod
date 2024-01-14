import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets.dart';

class KCircleAvatar extends StatelessWidget {
  const KCircleAvatar({
    super.key,
    required this.imgUrl,
    this.radius = 20,
    this.onTap,
    this.icon,
    this.enableBorder = true,
    this.bgColor,
  });

  final String imgUrl;
  final double radius;
  final bool enableBorder;
  final VoidCallback? onTap;
  final Widget? icon;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return KInkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.w),
      child: CircleAvatar(
        radius: enableBorder ? radius + 1 : radius - 1,
        backgroundColor: bgColor ?? Theme.of(context).colorScheme.primary,
        child: CircleAvatar(
          radius: radius,
          backgroundColor: bgColor ?? Theme.of(context).colorScheme.background,
          backgroundImage: imgUrl.isNotEmpty
              ? CachedNetworkImageProvider(
                  imgUrl,
                  errorListener: (err) =>
                      const Icon(Icons.error_outline_outlined),
                )
              : null,
          child: icon,
        ),
      ),
    );
  }
}
