import 'package:flutter/material.dart';
import 'detail_screen.dart';
import 'profile_screen.dart';
import '../data/mock_articles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildCategoryButtons(),
          Expanded(
            child: ListView.builder(
              itemCount: mockArticles.length,
              itemBuilder: (context, index) {
                final article = mockArticles[index];
                return ListTile(
                  leading: (article['urlToImage'] as String?) != null
                      ? Image.network(
                          article['urlToImage'] as String,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        )
                      : const Icon(Icons.image, size: 50),
                  title:
                      Text(article['title'] as String? ?? 'No Title Available'),
                  subtitle: Text(
                    '${(article['source'] as String?) ?? 'Unknown Source'} - ${(article['author'] as String?) ?? 'Unknown Author'}',
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(article: article),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButtons() {
    final categories = ['Technology', 'Sports', 'Politics'];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: categories
            .map((category) => ElevatedButton(
                  onPressed: () {},
                  child: Text(category),
                ))
            .toList(),
      ),
    );
  }
}
