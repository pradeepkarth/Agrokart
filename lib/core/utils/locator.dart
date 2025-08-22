import 'package:get_it/get_it.dart';
import '../../features/auth/data/repositories/auth_repository.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());
}
