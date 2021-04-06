extension IterableExtensions<T> on Iterable<T> {
  /// get the first item that match expression or null if not any
  T? firstOrDefault([bool Function(T element)? test]) {
    var filtered = test == null ? this : where(test);
    if (filtered.isNotEmpty) {
      return filtered.first;
    } else {
      return null;
    }
  }

  /// get the last item that match expression or null if not any
  T? lastOrDefault([bool Function(T element)? test]) {
    var filtered = test == null ? this : where(test);
    if (filtered.isNotEmpty) {
      return filtered.last;
    } else {
      return null;
    }
  }

  /// map elements with index and return new map
  Iterable<E> indexedMap<E>(E Function(int index, T e) f) sync* {
    var index = 0;
    for (var element in this) {
      yield f(index, element);
      index++;
    }
  }

  /// loap items with index and element arguments
  void indexedForEach(void Function(int index, T element) f) {
    var index = 0;
    for (var element in this) {
      f(index, element);
      index++;
    }
  }
}
