class CollectionUtility {
  static Iterable<T> insertBetweenAll<T>(Iterable<T> collection, T value) {
    var result = <T>[];

    bool isFirstContent = true;
    for (var content in collection) {
      if (isFirstContent) {
        isFirstContent = false;
      } else {
        // 先頭以外に値を挿入する
        result.add(value);
      }

      result.add(content);
    }

    return result;
  }
}
