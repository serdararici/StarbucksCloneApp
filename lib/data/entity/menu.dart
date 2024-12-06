
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

/*
List<Menu> menuItems = [
  Menu(
    id: '1',
    name: 'Filter Coffee',
    category: 'Filter Coffee', // Filter Coffee kategorisi
    subCategory: 'Hot Drinks',  // Alt kategori ekleyebilirsiniz
    iconPath: 'https://www.digitalassets.starbucks.eu/sites/starbucks-medialibrary/files/Fresh-Brewed-Coffee---Feb-2023.jpeg',
  ),
  Menu(
    id: '2',
    name: 'Cold Brew',
    category: 'Filter Coffee', // Filter Coffee kategorisi
    subCategory: 'Cold Drinks',
    iconPath: 'https://globalassets.starbucks.com/digitalassets/products/bev/SBX20210611_ColdBrew.jpg?impolicy=1by1_wide_topcrop_630',
  ),
  Menu(
    id: '3',
    name: 'Cold Brew Latte',
    category: 'Filter Coffee', // Filter Coffee kategorisi
    subCategory: 'Cold Drinks',
    iconPath: 'https://www.digitalassets.starbucks.eu/sites/starbucks-medialibrary/files/Cold-Brew-Latte_1.jpeg',
  ),
  Menu(
    id: '4',
    name: 'Caffè Misto',
    category: 'Filter Coffee', // Filter Coffee kategorisi
    subCategory: 'Hot Drinks',
    iconPath: 'https://globalassets.starbucks.com/digitalassets/products/bev/SBX20190617_CaffeMisto.jpg?impolicy=1by1_wide_topcrop_630',
  ),
];
*/