import 'package:bader/models/user.dart';
import 'package:bader/providers/auth_provider.dart';
import 'package:bader/providers/tip_provider.dart';
import 'package:bader/views/add_tip.dart';
import 'package:bader/views/myhomepage.dart';
import 'package:bader/views/signin.dart';
import 'package:bader/views/signup.dart';
import 'package:bader/views/tips.dart';
import 'package:bader/views/user_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => TipProvider(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}

final router = GoRouter(routes: [
  GoRoute(
    path: "/home",
    name: "home",
    builder: (context, state) => MyHomePage(),
  ),
  GoRoute(
    path: "/",
    name: 'signup',
    builder: (context, state) => SignupPage(),
  ),
  GoRoute(
    path: "/MyProfile",
    name: 'MyProfile',
    builder: (context, state) => MyProfile(),
  ),
  GoRoute(
    path: "/signin",
    name: "signin",
    builder: (context, state) => SigninPage(),
  ),
  GoRoute(
    path: "/addTip",
    name: "addTip",
    builder: (context, state) => AddTipPage(),
  ),
  GoRoute(
    path: "/Tips",
    name: "Tips",
    builder: (context, state) => TipsListPage(),
  ),
]);
