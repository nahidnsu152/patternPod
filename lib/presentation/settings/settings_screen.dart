import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../theme/theme.dart';
import '../../utils/strings.dart';

class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = useState(ref.read(themeProvider).theme == "dark");
    final box = Hive.box(KStrings.cacheBox);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Switch(
            value: isDarkMode.value,
            onChanged: (value) {
              isDarkMode.value = value;
              ref.read(themeProvider).toggle(value);
            }),
      ],
    );
  }
}
