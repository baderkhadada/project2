import 'package:bader/models/tip.dart';
import 'package:bader/providers/tip_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AddTipPage extends StatelessWidget {
  AddTipPage({super.key});

  final tipTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Tip"),
      ),
      body: Column(
        children: [
          TextField(
            controller: tipTextController,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                context
                    .read<TipProvider>()
                    .addTip(tip: Tip(text: tipTextController.text));
                context.pop();
              },
              child: Text("submit"))
        ],
      ),
    );
  }
}
