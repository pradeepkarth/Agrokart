abstract class IAuthRepository {
  Future<void> login({
    required String email,
    required String password,
    required String role,
  });

  Future<void> register({
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required String role,
  });
}
