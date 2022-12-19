import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../theme/theme.dart';
import '../../utils/size_constant.dart';
import '../../utils/strings.dart';
import '../../widgets/k_list_tile.dart';
import '../../utils/text_theme_style_x.dart';
import '../../utils/custom_style.dart';

class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = useState(ref.read(themeProvider).theme == "dark");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          gap20,
          Padding(
            padding: paddingH20,
            child: KListTile(
              color: context.color.onSecondary,
              title: Text(
                KStrings.theme,
                style: context.profileTitleStyle,
              ),
              trailing: Switch(
                value: isDarkMode.value,
                onChanged: (value) {
                  isDarkMode.value = value;
                  ref.read(themeProvider).toggle(value);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
