import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../repositories/auth_repository_interface.dart';

class RegisterUseCase {
  final IAuthRepository repository;
  RegisterUseCase(this.repository);

  Future<Either<Failure, void>> call({
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required String role,
  }) async {
    try {
      await repository.register(
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        phone: phone,
        role: role,
      );
      return right(null);
    } catch (e) {
      return left(AuthFailure(e.toString()));
    }
  }
}
