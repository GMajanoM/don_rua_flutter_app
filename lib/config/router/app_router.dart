import 'package:go_router/go_router.dart';
import 'package:donrua_app/features/general/general.dart';

final appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
