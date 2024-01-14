import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:patternpod/utils/alogrithms/sort/heap_sort.dart';

import '../../utils/alogrithms/search/binary_search.dart';
import '../../utils/alogrithms/search/linear_search.dart';
import '../../utils/alogrithms/sort/bubble_sort.dart';
import '../../utils/alogrithms/sort/insertion_sort.dart';
import '../../utils/alogrithms/sort/merge_sort.dart';
import '../../utils/alogrithms/sort/quick_sort.dart';
import '../../utils/alogrithms/sort/selection_sort.dart';
import '../../utils/alogrithms/sort/tim_sort.dart';
import '../../utils/utils.dart';
import '../../widgets/widgets.dart';
import '../drawer/side_menu.dart';
import 'pages/query_parameters_screen.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final time = DateTime.now();
    final myExampleList = <String>['Sam', 'John', 'Maya'];
    final val = useState(0.0);

    //? Binary Search
    List<int> arr = [0, 1, 3, 4, 5, 8, 9, 22];
    int userValue = 3;
    int min = 0;
    int max = arr.length - 1;
    Logger.v("Binary Search: ${binarySearch(arr, userValue, min, max)}");

    //? Linear Search
    Logger.v("linear Search: ${linearSearch(arr, userValue)}");

    //? Bubble Sort
    List<int> array = [5, 1, 4, 2, 8];
    List<int> sortedarray = bubbleSort(array);
    Logger.v("Bubble Sort: $sortedarray");

    //? Insertion Sort
    Logger.v("Insertion Sort: ${insertionSort(array)}");

    //? Quick Sort
    int high = array.length - 1;
    int low = 0;
    Logger.v("Quick Sort: ${quickSort(array, low, high)}");

    //? Selection Sort
    Logger.v("Selection Sort: ${selectionSort(array)}");

    //? Merge Sort
    Logger.v("Merge Sort: ${mergeSort(array)}");

    //? Heap Sort
    Logger.v("Heap Sort: ${heapSort(array)}");

    //? Tim Sort
    List<int> demoList = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5];
    timSort(demoList);
    Logger.v("Tim Sort: $demoList");

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
          Text(time.time24Hours),

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
          ),
          const KTextFormField(
            hintText: "hintText",
          ),

          KElevatedButton(
            onPressed: () {
              context.push(
                  "${QueryparameterScreen.route}?id=${10}&name=${'Nahid'}");
            },
            text: "Query Parameter Screen",
          ),
          KElevatedButton(
            onPressed: () {
              context.goNamed(
                'allRoutingExample',
                pathParameters: {'id': "10"},
                queryParameters: {'name': 'Nahid', 'age': '25'},
              );
            },
            text: "Push Named Screen",
          ),
        ],
      ),
    );
  }
}
