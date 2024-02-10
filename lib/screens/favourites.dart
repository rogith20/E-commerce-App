import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  final List<Map<String, dynamic>> favoriteItems;

  const FavoritesPage({Key? key, required this.favoriteItems})
      : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF233A66),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back, color: Color(0xFFFED691)),
        ),
        title: const Text('Favorites',style: TextStyle( color: Color(0xFFFED691),),),
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        itemCount: widget.favoriteItems.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> item = widget.favoriteItems[index];
          return ListTile(
            title: Text(item['title'],style: const TextStyle( color: Color(0xFFFED691),),),
            subtitle: Text(item['subtitle'],style: const TextStyle(color: Colors.white),),
          );
        },
      ),
    );
  }
}



