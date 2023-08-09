import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';

import '../home/home_screen.dart';
import '../settings/settings_screen.dart';

final bottomNavigatorKey = GlobalKey<State<BottomNavigationBar>>();

class MainNav extends HookConsumerWidget {
  static const route = '/mainNav';

  const MainNav({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navIndex = useState(0);
    final navWidget = [
      const HomeScreen(),
      const Center(child: Text("Profile Screen")),
      const SettingsScreen(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: navWidget[navIndex.value],

      //* Navigation Bar
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
            icon: Icon(EvaIcons.home),
            selectedIcon: Icon(EvaIcons.home_outline),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(EvaIcons.person),
            selectedIcon: Icon(EvaIcons.person_outline),
            label: 'Profile',
          ),
          NavigationDestination(
            icon: Icon(EvaIcons.settings),
            selectedIcon: Icon(EvaIcons.settings_outline),
            label: 'Settings',
          ),
        ],
      ),

      //* BottomNavigationBar

      // bottomNavigationBar: BottomNavigationBar(
      //   key: bottomNavigatorKey,
      //   currentIndex: navIndex.value,
      //   onTap: (index) {
      //     navIndex.value = index;
      //   },
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(IconlyLight.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(IconlyLight.profile),
      //       label: 'Profile',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(IconlyLight.setting),
      //       label: 'Settings',
      //     ),
      //   ],
      // ),

      //* BottomNavigationBar with Rounded Corner
      // bottomNavigationBar: Container(
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.only(
      //       topRight: Radius.circular(30.r),
      //       topLeft: Radius.circular(30.r),
      //     ),
      //     boxShadow: const [
      //       BoxShadow(
      //         color: Colors.black38,
      //         spreadRadius: 0,
      //         blurRadius: 10,
      //       ),
      //     ],
      //   ),
      //   child: ClipRRect(
      //     borderRadius: BorderRadius.only(
      //       topLeft: Radius.circular(30.r),
      //       topRight: Radius.circular(30.r),
      //     ),
      //     child: BottomNavigationBar(
      //       key: bottomNavigatorKey,
      //       currentIndex: navIndex.value,
      //       onTap: (index) {
      //         navIndex.value = index;
      //       },
      //       items: const [
      //         BottomNavigationBarItem(
      //           icon: Icon(Icons.favorite),
      //           label: 'Favourite',
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Icon(Icons.favorite),
      //           label: 'Favourite',
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Icon(Icons.favorite),
      //           label: 'Favourite',
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
