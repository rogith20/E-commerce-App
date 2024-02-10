import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _favoriteItems = [];

  List<Map<String, dynamic>> get favoriteItems => _favoriteItems;

  void addToFavorites(Map<String, dynamic> item) {
    _favoriteItems.add(item);
    notifyListeners();
  }

  void removeFromFavorites(Map<String, dynamic> item) {
    _favoriteItems.removeWhere(
          (favorite) =>
      favorite['title'] == item['title'] &&
          favorite['subtitle'] == item['subtitle'],
    );
    notifyListeners();
  }
}
