import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../repositories/auth_repository_interface.dart';

class LoginUseCase {
  final IAuthRepository repository;
  LoginUseCase(this.repository);

  Future<Either<Failure, void>> call({required String email, required String password, required String role}) async {
    try {
      await repository.login(email: email, password: password, role: role);
      return right(null);
    } catch (e) {
      return left(AuthFailure(e.toString()));
    }
  }
}
