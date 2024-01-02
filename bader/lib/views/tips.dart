import 'package:bader/providers/tip_provider.dart';
import 'package:bader/widgets/tips_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class TipsListPage extends StatelessWidget {
  const TipsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tips"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/addTip');
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
          future: Provider.of<TipProvider>(context, listen: false).getTips(),
          builder: (context, dataSnapshot) {
            return Consumer<TipProvider>(
              builder: (context, tip, child) => Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: tip.tips.length,
                    itemBuilder: (context, index) =>
                        TipCard(tip: tip.tips[index])),
              ),
            );
          }),
    );
  }
}
