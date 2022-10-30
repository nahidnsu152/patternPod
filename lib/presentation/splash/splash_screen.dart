import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:patternpod/presentation/main_nav/main_nav.dart';

// class SplashScreen extends StatefulHookConsumerWidget {
//   static const route = '/';

//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends ConsumerState<SplashScreen> {
//   @override
//   void initState() {
//     Future.delayed(const Duration(seconds: 3), () {
//       // Navigator.pushReplacement(
//       //     context,
//       //     MaterialPageRoute(
//       //       builder: (context) => LoginScreen(),
//       //     ));
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     useEffect(() {
//       Future.delayed(const Duration(seconds: 3), () {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => SignInScreen()),
//         );
//         // context.pop();
//         // context.go('/login');
//         // Router.neglect(context, () {
//         //   context.go("/login");
//         // });
//       });
//       return null;
//     }, []);

//     var size = MediaQuery.of(context).size;
//     Logger.v('size: $size');
//     return const Scaffold(
//       body: Center(child: Text("VISA management system")),
//     );
//   }
// }

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
