import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:go_router/go_router.dart';
import 'package:bader/providers/auth_provider.dart';
import 'package:bader/providers/tip_provider.dart';
import 'package:bader/services/client.dart';
import 'package:bader/widgets/tips_page.dart';

class TipsListPage extends StatefulWidget {
  TipsListPage({Key? key}) : super(key: key);

  @override
  State<TipsListPage> createState() => _TipsListPageState();
}

class _TipsListPageState extends State<TipsListPage> {
  TextEditingController searchController = TextEditingController();

  Widget _buildMyTipsList(BuildContext context) {
    String username = '';
    final token = context.watch<AuthProvider>().token;
    if (token.isNotEmpty) {
      Map<String, dynamic>? decodedToken = Jwt.parseJwt(token);
      username = decodedToken['username'];
      print('Username from token: $username');
    }
    return FutureBuilder(
      future: context.read<TipProvider>().myTips(username),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.error != null) {
          return const Center(child: Text('An error occurred'));
        } else {
          return Consumer<TipProvider>(
            builder: (context, tipsProvider, child) {
              var deletedTips = [];
              Future<void> deleteTip(int? id) async {
                if (deletedTips.contains(id)) {}
                try {
                  await ApiClient.delete('/tips/$id');

                  tipsProvider.tips.removeWhere((e) => e.id == id);
                  tipsProvider.myTipsList.removeWhere((e) => e.id == id);
                } catch (error) {
                  print('Error deleting tip: $error');
                }
                tipsProvider.getTips();
                tipsProvider.myTips(username);
              }

              ;
              return ListView.builder(
                shrinkWrap: true,
                itemCount: tipsProvider.myTipsList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                        title: Text("${tipsProvider.myTipsList[index].text}"),
                        subtitle: Text(
                            'By: ${tipsProvider.myTipsList[index].author}'),
                        trailing: IconButton(
                            onPressed: () {
                              deleteTip(tipsProvider.myTipsList[index].id);
                            },
                            icon: Icon(Icons.delete))),
                  );
                },
              );
            },
          );
        }
      },
    );
  }

  Widget _buildTipsList(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: searchController,
            onChanged: (value) {
              context.read<TipProvider>().searchTips(value);
            },
            decoration: InputDecoration(
              labelText: 'Search by text or author',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ],
    );
  }

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
                itemBuilder: (context, index) => TipCard(tip: tip.tips[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
