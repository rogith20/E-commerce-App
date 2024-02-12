import 'package:ecommerce/custom_card.dart';
import 'package:ecommerce/screens/product_details.dart';
import 'package:flutter/material.dart';


class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _searchController = TextEditingController();

  // Call generateCustomNames to populate _items
  List<Map<String, dynamic>> _items = generateCustomNames();
  List<Map<String, dynamic>> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems.addAll(_items);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF233A66),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, size: 25, color: Color(0xFFFED691)),
            ),
            backgroundColor: Colors.transparent,
            title: TextField(
              controller: _searchController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.white70),
                border: InputBorder.none,
              ),
              onChanged: (value) {
                setState(() {
                  _filteredItems = _items
                      .where((item) =>
                      item['title'].toLowerCase().contains(value.toLowerCase()))
                      .toList();
                });
              },
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _filteredItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(20,5,20,5),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xFFFED691).withOpacity(0.1),
              ),
              child: ListTile(
                title: Text(
                  _filteredItems[index]['title'],
                  style: const TextStyle(color: Color(0xFFFED691),fontSize: 18),
                ),
                subtitle: Text(
                  _filteredItems[index]['subtitle'],
                  style: const TextStyle(color: Colors.white,fontSize: 18),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetails(
                        itemName: _filteredItems[index]['title'],
                        product: _filteredItems[index],
                      ),
                    ),
                  );
                },
                trailing: const Icon(Icons.transit_enterexit,color: Colors.white,size: 30),
              ),
            ),
          );
        },
      ),
    );
  }
}
