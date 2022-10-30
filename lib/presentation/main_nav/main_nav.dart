import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:patternpod/presentation/settings/settings_screen.dart';


final bottomNavigatorKey = GlobalKey<State<BottomNavigationBar>>();

class MainNav extends HookConsumerWidget {
  static const route = '/mainNav';

  const MainNav({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final authState = ref.watch(authProvider);

    final navIndex = useState(0);
    final navWidget = [
      // const HomeScreen(),
      // const ApplyVisaScreen(),
      // const ProfileScreen(),
      const Center(child: Text("Home Screen")),

      const Center(child: Text("Profile Screen")),
      const SettingsScreen(),
    ];
    // useEffect(() {
    //   Future.microtask(() => ref.read(homeProvider.notifier).getCountries());

    //   return null;
    // }, []);
    return Scaffold(
      body: navWidget[navIndex.value],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        key: bottomNavigatorKey,
        selectedIndex: navIndex.value,
        onDestinationSelected: (index) {
          navIndex.value = index;
        },
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        animationDuration: const Duration(milliseconds: 500),
        destinations: const [
          NavigationDestination(
            icon: Icon(IconlyLight.home),
            selectedIcon: Icon(
              IconlyBold.home,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(IconlyLight.profile),
            selectedIcon: Icon(IconlyBold.profile),
            label: 'Profile',
          ),
          NavigationDestination(
            icon: Icon(IconlyLight.setting),
            selectedIcon: Icon(IconlyBold.setting),
            label: 'Settings',
          ),
          // const NavigationDestination(
          //   icon: Icon(EvaIcons.shoppingCartOutline),
          //   selectedIcon: Icon(EvaIcons.shoppingCart),
          //   label: 'Cart',
          // ),
          // const NavigationDestination(
          //   icon: Icon(EvaIcons.bookOpenOutline),
          //   selectedIcon: Icon(EvaIcons.bookOpen),
          //   label: 'My Courses',
          // ),
          // NavigationDestination(
          //   icon: ClipOval(
          //     child: SizedBox(
          //       height: 30.w,
          //       width: 30.w,
          //       child: authState.user.avatar.isNotEmpty
          //           ? CachedNetworkImage(
          //               imageUrl: (APIRoute.baseURL + authState.user.avatar),
          //               fit: BoxFit.cover,
          //               placeholder: (context, url) {
          //                 return const Icon(Icons.person_outline);
          //               },
          //               errorWidget: (context, url, error) {
          //                 return const Icon(Icons.error_outline_outlined);
          //               },
          //               // fadeOutDuration: const Duration(milliseconds: 300),
          //               // fadeInDuration: const Duration(milliseconds: 200),
          //               fadeInCurve: Curves.bounceInOut,
          //               fadeOutCurve: Curves.bounceOut,
          //             )
          //           : const Icon(Icons.person_outline),
          //     ),
          //   ),
          //   selectedIcon: ClipOval(
          //     child: SizedBox(
          //       height: 30.w,
          //       width: 30.w,
          //       child: authState.user.avatar.isNotEmpty
          //           ? CachedNetworkImage(
          //               imageUrl: (APIRoute.baseURL + authState.user.avatar),
          //               fit: BoxFit.cover,
          //               placeholder: (context, url) {
          //                 return const Icon(Icons.person_outline);
          //               },
          //               errorWidget: (context, url, error) {
          //                 return const Icon(Icons.error_outline_outlined);
          //               },
          //               // fadeOutDuration: const Duration(milliseconds: 300),
          //               // fadeInDuration: const Duration(milliseconds: 200),
          //               fadeInCurve: Curves.bounceInOut,
          //               fadeOutCurve: Curves.bounceOut,
          //             )
          //           : const Icon(Icons.person),
          //     ),
          //   ),
          //   label: 'Profile',
          // ),
        ],
      ),
    );
  }
}
