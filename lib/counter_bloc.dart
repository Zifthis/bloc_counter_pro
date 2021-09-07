import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

enum CounterAction { Increment, Decrement, Rest }

class CounterBloc {
  int counter = 0;
  final _stateStreamController = StreamController<int>();

  StreamSink<int> get counterSink => _stateStreamController.sink;

  Stream<int> get counterStream => _stateStreamController.stream;

  final _eventStreamContoller = StreamController<CounterAction>();

  StreamSink<CounterAction> get eventSink => _eventStreamContoller.sink;

  Stream<CounterAction> get eventStream => _eventStreamContoller.stream;

  CounterBloc() {
    eventStream.listen((event) {
      if (event == CounterAction.Increment) {
        counter++;
      } else if (event == CounterAction.Decrement) {
        counter--;
      } else {
        counter = 0;
      }
      counterSink.add(counter);
    });
  }

}
