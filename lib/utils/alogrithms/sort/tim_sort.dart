// import 'dart:math';

// const int RUN = 32;
// void insertionSort(List list, int left, int right) {
//   for (int i = left + 1; i <= right; i++) {
//     int temp = list[i];
//     int j = i - 1;
//     while (j >= left && list[j] > temp) {
//       list[j + 1] = list[j];
//       j--;
//     }
//     list[j + 1] = temp;
//   }
// }

// List<int> merge(List<int> list, int left, int middle, int right) {
//   int length1 = middle - left + 1, length2 = right - middle;
//   List leftList = [length1], rightList = [length2];

//   for (int i = 0; i < length1; i++) {
//     leftList[i] = list[left + i];
//   }

//   for (int i = 0; i < length2; i++) {
//     rightList[i] = list[middle + 1 + i];
//   }

//   int i = 0, j = 0, k = 0;
//   while (i < length1 && j < length2) {
//     if (leftList[i] <= rightList[j]) {
//       list[k] = leftList[i];
//       i++;
//     } else {
//       list[k] = rightList[j];
//       j++;
//     }
//     k++;
//   }

//   while (i < length1) {
//     list[k] = leftList[i];
//     i++;
//     k++;
//   }

//   while (j < length2) {
//     list[k] = rightList[j];
//     k++;
//     j++;
//   }
//   return list;
// }

// List<int> timSort(List<int> list, int n) {
//   var result = <int>[];
//   for (int i = 0; i < n; i += RUN) {
//     insertionSort(list, i, min((i + 31), n - 1));
//   }

//   for (int size = RUN; size < n; size = 2 * size) {
//     for (int left = 0; left < n; left += 2 * size) {
//       int middle = left + size - 1;
//       int right = min((left + 2 * size - 1), (n - 1));
//       result = merge(list, left, middle, right);
//     }
//   }
//   return result;
// }

import 'dart:math';

void timSort(List arr) {
  int n = arr.length;
  int minRun = _minRunLength(n);

  for (int i = 0; i < n; i += minRun) {
    _insertionSort(arr, i, min(i + minRun, n));
  }

  for (int size = minRun; size < n; size *= 2) {
    for (int left = 0; left < n; left += 2 * size) {
      int mid = left + size;
      int right = min(left + 2 * size, n);
      _merge(arr, left, mid, right);
    }
  }
}

int _minRunLength(int n) {
  int r = 0;
  while (n >= 64) {
    r |= n & 1;
    n >>= 1;
  }
  return n + r;
}

void _insertionSort(List arr, int left, int right) {
  for (int i = left + 1; i < right; i++) {
    dynamic key = arr[i];
    int j = i - 1;
    while (j >= left && arr[j].compareTo(key) > 0) {
      arr[j + 1] = arr[j];
      j--;
    }
    arr[j + 1] = key;
  }
}

void _merge(List arr, int left, int mid, int right) {
  int len1 = mid - left;
  int len2 = right - mid;

  List leftArr = [len1];
  List rightArr = [len2];

  for (int i = 0; i < len1; i++) {
    leftArr[i] = arr[left + i];
  }

  for (int i = 0; i < len2; i++) {
    rightArr[i] = arr[mid + i];
  }

  int i = 0, j = 0, k = left;

  while (i < len1 && j < len2) {
    if (leftArr[i].compareTo(rightArr[j]) <= 0) {
      arr[k++] = leftArr[i++];
    } else {
      arr[k++] = rightArr[j++];
    }
  }

  while (i < len1) {
    arr[k++] = leftArr[i++];
  }

  while (j < len2) {
    arr[k++] = rightArr[j++];
  }
}
