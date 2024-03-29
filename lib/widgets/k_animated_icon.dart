import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';

class KAnimatedIcon extends HookConsumerWidget {
  const KAnimatedIcon({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currIndex = useState(true);
    return IconButton(
      icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, anim) => RotationTransition(
                turns: child.key == const ValueKey('icon1')
                    ? Tween<double>(begin: 1, end: 0.75).animate(anim)
                    : Tween<double>(begin: 0.75, end: 1).animate(anim),
                child: FadeTransition(opacity: anim, child: child),
              ),
          child: currIndex.value == true
              ? const Icon(EvaIcons.arrow_down, key: ValueKey('icon1'))
              : const Icon(
                  EvaIcons.arrow_down_outline,
                  key: ValueKey('icon2'),
                )),
      onPressed: () {
        currIndex.value = !currIndex.value;
      },
    );
  }
}
