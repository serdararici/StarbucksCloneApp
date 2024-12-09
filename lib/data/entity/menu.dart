
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Menu {
  final String id;
  final String name;
  final String category;
  final String subCategory;
  final String iconPath;

  Menu({
    required this.id,
    required this.name,
    required this.category,
    this.subCategory = '',
    this.iconPath = '',
  });

  factory Menu.fromJson(Map<dynamic, dynamic> json, String key) {
    return Menu(id: key,
        name: json["name"] as String,
        category: json["category"] as String,
        subCategory: json["subCategory"] ?? '',
        iconPath: json["iconPath"] ?? ''
    );
  }
}

var collectionMenu = FirebaseFirestore.instance.collection("Menu");
Future<List<Menu>> getMenuItems() async {
  try {
    // Firestore koleksiyonundaki verileri al
    QuerySnapshot snapshot = await collectionMenu.get();

    // Gelen verileri Menu modeline dönüştür
    List<Menu> menuItems = snapshot.docs.map((doc) {
      return Menu.fromJson(doc.data() as Map<String, dynamic>, doc.id);
    }).toList();

    return menuItems;
  } catch (e) {
    print("Error fetching menu items: $e");
    return [];
  }
}
////////////////////
Future<List<Menu>> getMenuItemsByCategory(category) async {
  try {
    // Firestore koleksiyonundaki verileri al
    QuerySnapshot snapshot = await collectionMenu.where('category', isEqualTo: category).get();

    // Gelen verileri Menu modeline dönüştür
    List<Menu> menuItems = snapshot.docs.map((doc) {
      return Menu.fromJson(doc.data() as Map<String, dynamic>, doc.id);
    }).toList();

    return menuItems;
  } catch (e) {
    print("Error fetching menu items: $e");
    return [];
  }
}