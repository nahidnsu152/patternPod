import 'package:flutter_easylogger/flutter_logger.dart';

binarySearch(List<int> arr, int userValue, int min, int max) {
  if (max >= min) {
    Logger.v('min $min');
    Logger.v('max $max');
    int mid = ((max + min) / 2).floor();
    if (userValue == arr[mid]) {
      Logger.v('your item is at index: $mid');
    } else if (userValue > arr[mid]) {
      binarySearch(arr, userValue, mid + 1, max);
    } else {
      binarySearch(arr, userValue, min, mid - 1);
    }
  }
  return null;
}
