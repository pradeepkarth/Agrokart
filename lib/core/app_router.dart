import 'package:go_router/go_router.dart';
import 'package:myapp/features/auth/presentation/screens/auth_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/auth', // Set the initial route to the authentication screen
  routes: [
    GoRoute(
      path: '/auth',
      builder: (context, state) => const AuthScreen(),
    ),
  ],
);