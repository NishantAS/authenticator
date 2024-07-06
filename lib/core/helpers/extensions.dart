extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}

extension Range on num {
  bool inRange(num low, num high) {
    return (low <= this && this <= high);
  }
}
