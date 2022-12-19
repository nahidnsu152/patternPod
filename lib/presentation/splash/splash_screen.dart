import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../main_nav/main_nav.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});
  static const route = '/';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.delayed(const Duration(seconds: 2), () {
        context.replace(MainNav.route);
      });
      return null;
    }, []);

    var size = MediaQuery.of(context).size;
    Logger.v('size: $size');
    return const Scaffold(
      body: Center(child: Text("Splash Screen")),
    );
  }
}
