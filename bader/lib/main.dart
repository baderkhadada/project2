import 'package:bader/providers/auth_provider.dart';
import 'package:bader/providers/medprovider.dart';
import 'package:bader/views/add_note.dart';
import 'package:bader/views/myhomepage.dart';
import 'package:bader/views/signin.dart';
import 'package:bader/views/signup.dart';
import 'package:bader/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => MedProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
    ),
  ], child: MyApp()));
}

// ChangeNotifierProvider(
//   create: (context) => TodoProvider(),

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }

  final _router = GoRouter(routes: [
    GoRoute(
      path: "/home",
      name: "home",
      builder: (context, state) => MyHomePage(),
    ),
    GoRoute(
      path: "/AddNote",
      name: "AddNote",
      builder: (context, state) => AddNote(),
    ),
    GoRoute(
      path: "/signup",
      name: 'signup',
      builder: (context, state) => SignupPage(),
    ),
    GoRoute(
      path: "/",
      name: 'splash',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: "/signin",
      name: "signin",
      builder: (context, state) => SigninPage(),
    ),
  ]);
}
