import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:patternpod/l10n/app_localizations_context.dart';

import '../../main.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const KAppBar(
        titleText: 'Home',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //? Change Language
          KElevatedButton(
            onPressed: () {
              ref.read(appLocalProvider.notifier).update(
                    (state) => state.languageCode == 'en'
                        ? const Locale("bn", "BD")
                        : const Locale("en", "US"),
                  );
            },
            foregroundColor: Colors.white,
            text: "Change Language",
          ),
          Text(context.local.demoText),
        ],
      ),
    );
  }
}
