import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:patternpod/l10n/app_localizations_context.dart';
import 'package:patternpod/utils/alogrithms/sort/heap_sort.dart';

import '../../main.dart';
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
    print("Binary Search: ${binarySearch(arr, userValue, min, max)}");

    //? Linear Search
    print("linear Search: ${linearSearch(arr, userValue)}");

    //? Bubble Sort
    List<int> array = [5, 1, 4, 2, 8];
    List<int> sortedarray = bubbleSort(array);
    print("Bubble Sort: $sortedarray");

    //? Insertion Sort
    print("Insertion Sort: ${insertionSort(array)}");

    //? Quick Sort
    int high = array.length - 1;
    int low = 0;
    print("Quick Sort: ${quickSort(array, low, high)}");

    //? Selection Sort
    print("Selection Sort: ${selectionSort(array)}");

    //? Merge Sort
    print("Merge Sort: ${mergeSort(array)}");

    //? Heap Sort
    print("Heap Sort: ${heapSort(array)}");

    //? Tim Sort
    List<int> demoList = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5];
    timSort(demoList);
    print("Tim Sort: $demoList");

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
