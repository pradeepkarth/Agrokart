import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/app/base_cubit.dart';
import 'package:myapp/features/auth/domain/usecases/login_usecase.dart';
import 'package:myapp/features/auth/domain/usecases/register_usecase.dart';

/// Manages authentication logic and state for login and registration.
class AuthCubit extends Cubit<BaseState> with BaseCubitMixin {
  /// Creates an [AuthCubit] with required use cases.
  AuthCubit({required this.loginUseCase, required this.registerUseCase})
    : super(InitialState());

  /// Use case for login operations.
  final LoginUseCase loginUseCase;

  /// Use case for registration operations.
  final RegisterUseCase registerUseCase;

  /// Attempts to log in with the provided credentials and role.
  Future<void> login({
    required String email,
    required String password,
    required String role,
  }) async {
    emitLoading();
    final result = await loginUseCase(
      email: email,
      password: password,
      role: role,
    );
    result.fold(
      (failure) => emitError(message: failure.message),
      (_) => emitSuccess(),
    );
  }

  /// Attempts to register a new user with the provided credentials and role.
  Future<void> register({
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required String role,
  }) async {
    emitLoading();
    final result = await registerUseCase(
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      phone: phone,
      role: role,
    );
    result.fold(
      (failure) => emitError(message: failure.message),
      (_) => emitSuccess(),
    );
  }
}
