import 'package:bader/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
// import 'package:todo_test_api/providers/auth_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<String>(
        future: context.read<AuthProvider>().readFromStorage(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final String? token = snapshot.data;

            if (token != null && token.isNotEmpty) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                context.goNamed('home');
              });
            } else {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                context.goNamed('signup');
              });
            }
            return const SizedBox();
          }
        },
      ),
    );
  }
}
