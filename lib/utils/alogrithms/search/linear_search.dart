linearSearch(List<int> array, int x) {
  for (int i = 0; i < array.length;) {
    if (array[i] == x) {
      return i;
    } else {
      return -1;
    }
  }
}
