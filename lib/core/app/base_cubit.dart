import 'package:bloc/bloc.dart';

/// --- STATES ---
/// An abstract base class for all states in the application.
abstract class BaseState {}

/// The initial state of a Cubit.
class InitialState extends BaseState {}

/// The state that indicates a process is currently running.
class LoadingState extends BaseState {}

/// The state that represents a successful completion of a process.
class SuccessState<T> extends BaseState {
  final T? data;
  SuccessState({this.data});
}

/// The state that represents an error or failure during a process.
class ErrorState extends BaseState {
  final String? message;
  ErrorState({this.message});
}

/// --- BASE CUBIT TYPE ---
typedef BaseCubit = Cubit<BaseState>;

/// --- BASE CUBIT MIXIN ---
/// A mixin that provides the four core state transition methods.
/// Any Cubit that needs these states can use this mixin.
mixin BaseCubitMixin on BaseCubit {
  void emitInitial() => emit(InitialState());
  void emitLoading() => emit(LoadingState());
  void emitSuccess<T>({T? data}) => emit(SuccessState<T>(data: data));
  void emitError({String? message}) => emit(ErrorState(message: message));
}
