import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:patternpod/utils/custom_style.dart';
import 'package:patternpod/utils/size_constant.dart';
import 'package:patternpod/utils/strings.dart';
import 'package:patternpod/utils/text_theme_style_x.dart';
import 'package:patternpod/widgets/k_buttons.dart';
import 'package:patternpod/widgets/k_cached_network_image.dart';
import 'package:patternpod/widgets/k_drop_down_button.dart';
import 'package:patternpod/widgets/k_list_view_separated.dart';
import 'package:patternpod/widgets/k_loader.dart';

import '../../theme/theme.dart';
import '../../widgets/k_list_tile.dart';

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
