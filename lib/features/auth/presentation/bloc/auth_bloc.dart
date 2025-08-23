import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:myapp/features/auth/domain/usecases/login_usecase.dart';
import 'package:myapp/features/auth/domain/usecases/register_usecase.dart';
import 'package:myapp/core/app/base_cubit.dart';

class AuthCubit extends Cubit<BaseState> with BaseCubitMixin {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  AuthCubit({required this.loginUseCase, required this.registerUseCase}) : super(InitialState());

  Future<void> login({required String email, required String password, required String role}) async {
    emitLoading();
    final result = await loginUseCase(email: email, password: password, role: role);
    result.fold(
      (failure) => emitError(message: failure.message),
      (_) => emitSuccess(),
    );
  }

  Future<void> register({required String email, required String password, required String confirmPassword, required String phone, required String role}) async {
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
