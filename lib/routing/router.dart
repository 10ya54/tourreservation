import 'package:go_router/go_router.dart';
import 'package:tourreservation/routing/routes.dart';

import '../ui/login/widgets/login_screen.dart';
import '../ui/home/widgets/home_screen.dart';

final router = GoRouter(
  initialLocation: Routes.login,
  routes: [
    GoRoute(
      path: Routes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(path: Routes.home, builder: (context, state) => const HomeScreen()),
  ],
);
