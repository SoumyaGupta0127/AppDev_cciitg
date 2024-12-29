import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> article;

  const DetailScreen({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article['title'])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(article['urlToImage']),
            const SizedBox(height: 16),
            Text(article['title'],
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('By ${article['author']}'),
            const SizedBox(height: 8),
            Text('Source: ${article['source']}'),
            const SizedBox(height: 16),
            Text(article['content']),
          ],
        ),
      ),
    );
  }
}
