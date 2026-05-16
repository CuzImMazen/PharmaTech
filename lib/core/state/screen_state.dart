import 'package:pharmacy_app/core/error/failure.dart';

abstract class ScreenState {
  const ScreenState();
}

class InitialState extends ScreenState {
  const InitialState();
}

class LoadingState extends ScreenState {
  const LoadingState();
}

class SuccessState<T> extends ScreenState {
  final T? data;
  const SuccessState([this.data]);
}

class FailureState extends ScreenState {
  final Failure failure;
  const FailureState(this.failure);
}
