import 'package:flutter/widgets.dart';
import 'package:patternpod/utils/dimensions.dart';

class AddVerticalSpace extends StatelessWidget {
  const AddVerticalSpace({
    Key? key,
    this.verticalSpace,
  }) : super(key: key);

  final double? verticalSpace;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: verticalSpace ?? Dimensions.defaultVerticalSpacing);
  }
}

class AddHorizontalSpace extends StatelessWidget {
  const AddHorizontalSpace({
    Key? key,
    this.horizontalSpace,
  }) : super(key: key);

  final double? horizontalSpace;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: horizontalSpace ?? Dimensions.defaultHorizontalSpacing);
  }
}

MainAxisAlignment mainStart = MainAxisAlignment.start;
MainAxisAlignment mainCenter = MainAxisAlignment.center;
MainAxisAlignment mainEnd = MainAxisAlignment.end;
MainAxisAlignment mainSpaceBet = MainAxisAlignment.spaceBetween;
MainAxisAlignment mainSpaceEven = MainAxisAlignment.spaceEvenly;
MainAxisAlignment mainSpaceAround = MainAxisAlignment.spaceAround;

MainAxisSize mainMax = MainAxisSize.max;
MainAxisSize mainMin = MainAxisSize.min;

CrossAxisAlignment crossStart = CrossAxisAlignment.start;
CrossAxisAlignment crossCenter = CrossAxisAlignment.center;
CrossAxisAlignment crossend = CrossAxisAlignment.end;
CrossAxisAlignment crossStretch = CrossAxisAlignment.stretch;
