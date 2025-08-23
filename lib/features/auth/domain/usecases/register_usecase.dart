import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/auth_repository_interface.dart';

/// Use case for handling user registration logic.
class RegisterUseCase {
  /// Creates a [RegisterUseCase] with the given repository.
  RegisterUseCase(this.repository);

  /// The authentication repository used for registration.
  final IAuthRepository repository;

  /// Attempts to register a user and returns either a [Failure] or success.
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
