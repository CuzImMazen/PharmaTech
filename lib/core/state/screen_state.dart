import 'package:pharmacy_app/core/error/failure.dart';

sealed class ScreenState {
  const ScreenState();
}

class InitialState extends ScreenState {
  const InitialState();
}

class LoadingState extends ScreenState {
  const LoadingState();
}

class SuccessState extends ScreenState {
  const SuccessState();
}

class FailureState extends ScreenState {
  final Failure failure;

  const FailureState(this.failure);
}
