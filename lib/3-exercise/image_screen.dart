import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ImageScreen()));
}

class ImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Loading')),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: 30,
        itemBuilder: (context, index) {
          return Image.network(
            "https://images.hdqwalls.com/wallpapers/skye-united-kingdom-8k-yh.jpg",
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: Image.asset('assets/load.gif'),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return const Center(
                child: Icon(Icons.error, color: Colors.red),
              );
            },
          );
        },
      ),
    );
  }
}
