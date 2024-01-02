import 'package:bader/models/user.dart';
import 'package:bader/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MyProfile extends StatelessWidget {
  MyProfile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        actions: [
          IconButton(
              onPressed: () {
                context.read<AuthProvider>().logOut();
                context.go('/signin');
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // User image
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  "https://t4.ftcdn.net/jpg/00/64/67/27/360_F_64672736_U5kpdGs9keUll8CRQ3p3YaEv2M6qkVY5.jpg"),
            ),

            SizedBox(height: 20),

            // Username
            Text(
              "Username: bader",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
