import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/utils.dart';
import '../../widgets/k_app_bar.dart';
import '../../widgets/widgets.dart';
import '../drawer/side_menu.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final time = DateTime.now();
    final myExampleList = <String>['Sam', 'John', 'Maya'];
    final val = useState(0.0);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const KAppBar(
        titleText: 'Home',
      ),
      drawer: const Drawer(
        width: 288,
        child: SideMenu(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Home Screen',
              style: context.titleLarge,
            ),
          ),

          //? DateTime extention usage
          Text(time.time24Hours()),

          //? Separate List extention usage
          Text(myExampleList.separated('-').join()),

          //? Theme Slider extention usage
          SizedBox(
            child: ThemedSlider.withTheme(
              value: val.value,
              min: 0.0,
              max: 200,
              divisions: 200,
              onChanged: (newVal) {
                val.value = newVal;
              },
              themeData: const SliderThemeData(
                trackHeight: 16,
                tickMarkShape: RoundSliderTickMarkShape(tickMarkRadius: 6),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16),
                thumbColor: Color(0xffffa938),
              ),
            ),
          ),

          //? Notification, toast etc global file usage
          KElevatedButton(
            onPressed: () {
              //showNotification(title: "Nahid");
              // showToast("Nahid");
              // showTimePicker(context: context, initialTime: TimeOfDay.now());
              // showFloatBottomSheet(
              //   context,
              //   builder: (context) => Container(
              //     height: 200,
              //     color: Colors.white,
              //     child: const Center(
              //       child: Text('This is a modal'),
              //     ),
              //   ),
              // );

              // showBotToastDialog(cancel: () {
              //   Navigator.pop(context);
              //   return null;
              // }, confirm: () {
              //   return null;
              // });
            },
            text: "Press ME",
          )
        ],
      ),
    );
  }
}
