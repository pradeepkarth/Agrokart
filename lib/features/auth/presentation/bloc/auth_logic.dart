import 'package:myapp/core/utils/locator.dart';
import 'package:myapp/features/auth/domain/repositories/auth_repository_interface.dart';

class AuthLogic {
  final IAuthRepository _authRepository = getIt<IAuthRepository>();

  Future<void> login({
    required String email,
    required String password,
    required String role,
  }) async {
    await _authRepository.login(
      email: email,
      password: password,
      role: role,
    );
  }

  Future<void> register({
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required String role,
  }) async {
    await _authRepository.register(
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      phone: phone,
      role: role,
    );
  }
}
