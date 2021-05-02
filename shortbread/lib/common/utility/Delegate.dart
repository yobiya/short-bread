class Delegate<T> {
  List<void Function(T)> _receiverList = <void Function(T)>[];

  void addReceiver(void Function(T) receiver) {
    _receiverList.add(receiver);
  }

  void call(T value) {
    for (var receiver in _receiverList) {
      receiver(value);
    }
  }
}
