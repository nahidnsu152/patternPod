import 'package:clean_api/clean_api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'application/global.dart';
import 'router/router.dart';
import 'theme/theme.dart';
import 'server/api_routes.dart';
import 'utils/dismiss_keyboard.dart';
import 'utils/strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Logger.init(
    kDebugMode, // isEnable ，if production ，please false
    isShowFile: false, // In the IDE, whether the file name is displayed
    isShowTime: false, // In the IDE, whether the time is displayed
  );

  await Hive.initFlutter();
  final box = await Hive.openBox(KStrings.cacheBox);

  final api = CleanApi.instance;

  api.setup(baseUrl: APIRoute.baseURL, showLogs: true);
  api.enableCache(box);

  api.setToken(
    {'Authorization': 'Bearer ${box.get(KStrings.token, defaultValue: '')}'},
  );

  final themeDatabaseService = DatabaseService();
  await themeDatabaseService.initTheme();

  runApp(
    ProviderScope(
      overrides: [
        databaseService.overrideWithValue(themeDatabaseService),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeProvider).theme;
    final router = ref.watch(routerProvider);
    return DismissKeyboard(
      child: ScreenUtilInit(
        designSize: const Size(411.4, 843.4),
        builder: (context, child) {
          return MaterialApp.router(
            title: KStrings.appName,
            debugShowCheckedModeBanner: false,
            themeMode: mode.isEmpty
                ? ThemeMode.system
                : mode == "dark"
                    ? ThemeMode.dark
                    : ThemeMode.light,
            theme: MyTheme.lightTheme,
            darkTheme: MyTheme.darkTheme,
            scaffoldMessengerKey: ref.watch(scaffoldKeyProvider),
            routeInformationProvider: router.routeInformationProvider,
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
            scrollBehavior: const ScrollBehavior().copyWith(
              physics: const BouncingScrollPhysics(),
            ),
            // home: child,
            // builder: BotToastInit(),
          );
        },
      ),
    );
  }
}
