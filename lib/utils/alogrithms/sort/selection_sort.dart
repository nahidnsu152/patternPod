List<int> selectionSort(List<int> list) {
  if (list.isEmpty) {
    return [];
  } else {
    int n = list.length;
    int i, steps;
    for (steps = 0; steps < n; steps++) {
      for (i = steps + 1; i < n; i++) {
        if (list[steps] > list[i]) {
          swap(list, steps, i);
        }
      }
    }
    return list;
  }
}

void swap(List<int> list, int steps, int i) {
  int temp = list[steps];
  list[steps] = list[i];
  list[i] = temp;
}
