import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  final Map<String, bool> _likedById = {};

  bool isLiked(String id) => _likedById[id] ?? false;

  void toggleLike(String id) {
    _likedById[id] = !isLiked(id);
    notifyListeners();
  }
}
