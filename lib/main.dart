import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dashboard.dart';
import 'error_page.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

const isLoggedIn = true;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(title: 'Go Router', routerConfig: _router);
  }
}

final GoRouter _router = GoRouter(
    errorBuilder: (BuildContext context, GoRouterState state) =>
        const ErrorPage(),
    redirect: (context, state) {
      if (isLoggedIn) {
        return '/test';
      } else {
        return '/';
      }
    },
    routes: <RouteBase>[
      GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) => const Login(),
          routes: <RouteBase>[
            GoRoute(
              path: 'dashboard',
              builder: (BuildContext context, GoRouterState state) {
                return const Dashboard();
              },
            ),
          ])
    ]);
