import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 157, 210, 237),
        title: Text(
          'Welcome bader',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
              ),
            ),
            SizedBox(height: 16.0),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                InkWell(
                  onTap: () {
                    GoRouter.of(context).push('/Tips');
                  },
                  child: _buildCard(
                      cardTitle: 'Tips', imageAsset: 'assets/images/tips.png'),
                ),
                InkWell(
                    onTap: () {
                      GoRouter.of(context).push('/Yoga');
                    },
                    child: _buildCard(
                        cardTitle: 'Yoga',
                        imageAsset: 'assets/images/Yoga.png')),
                InkWell(
                    onTap: () {
                      GoRouter.of(context).push('/Music');
                    },
                    child: _buildCard(
                        cardTitle: 'Music',
                        imageAsset: 'assets/images/music.png')),
                InkWell(
                    onTap: () {
                      GoRouter.of(context).push('/Meditation');
                    },
                    child: _buildCard(
                        cardTitle: 'Meditation',
                        imageAsset: 'assets/images/med.png')),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => GoRouter.of(context).push('/MyProfile'),
        child: Icon(Icons.person),
      ),
    );
  }

  Widget _buildCard({required String cardTitle, required String imageAsset}) {
    return Card(
      color: const Color.fromARGB(255, 157, 210, 237),
      elevation: 2.0,
      child: Column(
        children: [
          Image.asset(
            imageAsset,
            height: 120,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Text(
                cardTitle,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
