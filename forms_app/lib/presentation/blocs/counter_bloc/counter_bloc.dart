import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<CounterIncresed>(_onCounterIncreased);
    on<CounterReseted>(_onCounterReseted);
  }

  void _onCounterIncreased(CounterIncresed event, Emitter<CounterState> emit) {
    emit(
      state.copyWith(
        counter: state.counter + event.value,
        transactionCount: state.transactionCount + 1,
      ),
    );
  }

  void _onCounterReseted(CounterReseted event, Emitter<CounterState> emit) {
    print('reset');
    emit(
      state.copyWith(
        counter: 0,
        transactionCount: state.transactionCount + 1,
      ),
    );
  }
}
