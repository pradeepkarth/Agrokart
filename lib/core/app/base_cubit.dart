import 'package:flutter_bloc/flutter_bloc.dart';

/// --- STATES ---

/// An abstract base class for all states in the application.
abstract class BaseState {}

/// The initial state of a Cubit.
class InitialState extends BaseState {}

/// The state that indicates a process is currently running.
class LoadingState extends BaseState {}

/// The state that represents a successful completion of a process.
class SuccessState<T> extends BaseState {
  /// Creates a [SuccessState] with optional [data].
  SuccessState({this.data});

  /// The data associated with a successful state.
  final T? data;
}

/// The state that represents an error or failure during a process.
class ErrorState extends BaseState {
  /// Creates an [ErrorState] with an optional [message].
  ErrorState({this.message});

  /// The error message associated with the error state.
  final String? message;
}

/// --- BASE CUBIT TYPE ---

/// A type definition for Cubits that use [BaseState].
typedef BaseCubit = Cubit<BaseState>;

/// --- BASE CUBIT MIXIN ---

/// A mixin that provides the four core state transition methods.
/// Any Cubit that needs these states can use this mixin.
mixin BaseCubitMixin on BaseCubit {
  /// Emits the [InitialState].
  void emitInitial() => emit(InitialState());

  /// Emits the [LoadingState].
  void emitLoading() => emit(LoadingState());

  /// Emits the [SuccessState] with optional [data].
  void emitSuccess<T>({T? data}) => emit(SuccessState<T>(data: data));

  /// Emits the [ErrorState] with an optional [message].
  void emitError({String? message}) => emit(ErrorState(message: message));
}
