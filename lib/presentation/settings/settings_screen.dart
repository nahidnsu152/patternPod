import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:patternpod/widgets/k_buttons.dart';
import 'package:patternpod/widgets/k_cached_network_image.dart';
import 'package:patternpod/widgets/k_drop_down_button.dart';
import 'package:patternpod/widgets/k_list_view_separated.dart';
import 'package:patternpod/widgets/k_loader.dart';

import '../../theme/theme.dart';

class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = useState(ref.read(themeProvider).theme == "dark");
    final country = useState(["USA", "UK", "Canada", "Australia"]);
    //final box = Hive.box(KStrings.cacheBox);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Switch(
          value: isDarkMode.value,
          onChanged: (value) {
            isDarkMode.value = value;
            ref.read(themeProvider).toggle(value);
          },
        ),
        KElevatedButton(
          onPressed: () {},
          text: "text",
          //foregroundColor: Colors.white,
        ),
        KCachedNetworkImage(
          imageUrl: "https://picsum.photos/250?image=9",
        ),
        KDropDownButton(
          list: country,
          selectedValue: useState(0),
        ),
        KLoader(),
        SizedBox(
          height: 150,
          child: KListViewSeparated(
              builder: ((context, index) {
                return Text(country.value[index]);
              }),
              count: country.value.length),
        ),
      ],
    );
  }
}
