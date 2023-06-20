part of 'counter_bloc.dart';

abstract class CounterEvent {
  const CounterEvent();
}

class CounterIncresed extends CounterEvent {
  final int value;

  const CounterIncresed(this.value);
}

class CounterReseted extends CounterEvent {}
