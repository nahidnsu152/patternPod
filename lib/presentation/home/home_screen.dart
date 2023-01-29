import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:patternpod/presentation/drawer/side_menu.dart';
import 'package:patternpod/utils/text_theme_style_x.dart';

import '../../widgets/k_app_bar.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const KAppBar(
        titleText: 'Home',
      ),
      drawer: const Drawer(
        width: 288,
        child: SideMenu(),
      ),
      body: Center(
          child: Text(
        'Home Screen',
        style: context.titleLarge,
      )),
    );
  }
}
