import 'package:go_router/go_router.dart';
import 'package:myapp/presentation/auth/auth_screen.dart';
import 'package:myapp/presentation/buyer/buyer_dashboard_screen.dart';
import 'package:myapp/presentation/buyer/buyer_orders_screen.dart';
import 'package:myapp/presentation/buyer/buyer_pre_booking_screen.dart';
import 'package:myapp/presentation/buyer/buyer_product_detail_screen.dart';
import 'package:myapp/presentation/farmer/farmer_add_product_screen.dart';
import 'package:myapp/presentation/farmer/farmer_dashboard_screen.dart';
import 'package:myapp/presentation/farmer/farmer_listings_screen.dart';
import 'package:myapp/presentation/farmer/farmer_orders_screen.dart';
import 'package:myapp/presentation/onboarding/buyer_onboarding_screen.dart';
import 'package:myapp/presentation/onboarding/farmer_onboarding_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/auth', // Set the initial route to the authentication screen
  routes: [
    GoRoute(
      path: '/auth',
      builder: (context, state) => const AuthScreen(),
    ),
    GoRoute(
      path: '/farmer_dashboard',
      builder: (context, state) => const FarmerDashboardScreen(),
    ),
    GoRoute(
      path: '/farmer_listings',
      builder: (context, state) => const FarmerListingsScreen(),
    ),
    GoRoute(
      path: '/farmer_add_product',
      builder: (context, state) => const FarmerAddProductScreen(),
    ),
    GoRoute(
      path: '/farmer_orders',
      builder: (context, state) => const FarmerOrdersScreen(),
    ),
    GoRoute(
      path: '/buyer_dashboard',
      builder: (context, state) => const BuyerDashboardScreen(),
    ),
    GoRoute(
      path: '/buyer_product_detail',
      builder: (context, state) => const BuyerProductDetailScreen(),
    ),
    GoRoute(
      path: '/buyer_pre_booking',
      builder: (context, state) => const BuyerPreBookingScreen(),
    ),
    GoRoute(
      path: '/buyer_orders',
      builder: (context, state) => const BuyerOrdersScreen(),
    ),
    GoRoute(
      path: '/farmer_onboarding',
      builder: (context, state) => const FarmerOnboardingScreen(),
    ),
    GoRoute(
      path: '/buyer_onboarding',
      builder: (context, state) => const BuyerOnboardingScreen(),
    ),
  ],
);