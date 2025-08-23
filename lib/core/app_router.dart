import 'package:go_router/go_router.dart';
import 'package:myapp/features/auth/presentation/screens/auth_screen.dart';

/// AppRouter manages navigation and route generation for the application.
///
/// Use this class to define and handle named routes and navigation logic.
final GoRouter appRouter = GoRouter(
  initialLocation: '/auth',
  // Set the initial route to the authentication screen
  routes: [
    GoRoute(path: '/auth', builder: (context, state) => const AuthScreen()),
  ],
);
