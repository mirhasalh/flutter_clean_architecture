import 'package:go_router/go_router.dart';

import 'view/views.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Home(),
      routes: [
        GoRoute(
          path: 'add',
          builder: (context, state) => const AddTodo(),
        ),
      ],
    ),
  ],
);
