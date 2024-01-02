import 'package:bader/providers/auth_provider.dart';
import 'package:bader/providers/medprovider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
// import 'package:todo_test_api/providers/auth_provider.dart';
// import 'package:todo_test_api/providers/todo_provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        actions: [
          TextButton(
              onPressed: () {
                context
                    .read<AuthProvider>()
                    .logOut()
                    .whenComplete(() => context.goNamed('signin'));
              },
              child: Text("Logout"))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed("addNote");
        },
        child: Text("add"),
      ),
      body: FutureBuilder(
          future: context.read<MedProvider>().medList(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Consumer<MedProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount: value.medsList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(value.medsList[index].medName),
                        subtitle: Text(
                          value.medsList[index].isComplete.toString(),
                        ),
                        trailing: Checkbox(
                          value: value.medsList[index].isComplete,
                          onChanged: (checkBoxValue) {
                            context.read<MedProvider>().updateNote(
                                value.medsList[index].id, checkBoxValue);
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }),
    );
  }
}
