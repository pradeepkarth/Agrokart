import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/auth_repository_interface.dart';

/// Use case for handling user login logic.
class LoginUseCase {
  /// Creates a [LoginUseCase] with the given repository.
  LoginUseCase(this.repository);

  /// The authentication repository used for login.
  final IAuthRepository repository;

  /// Attempts to log in a user and returns either a [Failure] or success.
  Future<Either<Failure, void>> call({
    required String email,
    required String password,
    required String role,
  }) async {
    try {
      await repository.login(email: email, password: password, role: role);
      return right(null);
    } catch (e) {
      return left(AuthFailure(e.toString()));
    }
  }
}
