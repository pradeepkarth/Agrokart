/// Interface for authentication repository operations.
abstract class IAuthRepository {
  /// Logs in a user with the provided credentials and role.
  Future<void> login({
    required String email,
    required String password,
    required String role,
  });

  /// Registers a new user with the provided credentials and role.
  Future<void> register({
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required String role,
  });
}
