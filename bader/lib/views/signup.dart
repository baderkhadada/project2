import 'package:bader/models/user.dart';
import 'package:bader/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
// import 'package:todo_test_api/models/user.dart';
// import 'package:todo_test_api/providers/auth_provider.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final passwordController = TextEditingController();

  final usernameController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign up"),
        automaticallyImplyLeading: false,
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text("Sign Up"),
            TextField(
              decoration: const InputDecoration(hintText: 'Username'),
              controller: usernameController,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Password'),
              controller: passwordController,
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                final User user = User(
                    username: usernameController.text,
                    password: passwordController.text);
                context.read<AuthProvider>().signup(user: user).then((token) {
                  if (token.isNotEmpty) {
                    context.pushNamed("signin");
                  }
                });
              },
              child: const Text("Sign Up"),
            )
          ],
        ),
      ),
    );
  }
}
