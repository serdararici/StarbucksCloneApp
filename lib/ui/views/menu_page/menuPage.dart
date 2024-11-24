import 'package:flutter/material.dart';
import 'package:starbucks_clone_app/constants/colors.dart';
import 'package:starbucks_clone_app/ui/views/menu_page/menuAllPage.dart';
import 'package:starbucks_clone_app/ui/views/menu_page/menuFavoritesPage.dart';
import 'package:starbucks_clone_app/ui/views/menu_page/menuFeaturedPage.dart';
import 'package:starbucks_clone_app/ui/views/menu_page/menuOrderPage.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  String selectedTab = "All"; // Seçili butonu takip etmek için

  final List<String> tabs = ["All", "Featured", "Favorites", "Order"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Butonlar
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: tabs.map((tab) {
                final bool isSelected = selectedTab == tab;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTab = tab; // Seçilen butonu güncelle
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(
                        vertical: 3.0, horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AColors.primaryGreen
                          : Colors.white, // Seçiliyse yeşil, değilse beyaz
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AColors.primaryGreen, // Kenarlık rengi
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        tab,
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : Colors.black, // Seçiliyse beyaz, değilse siyah
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          // Seçili sekmeye göre içerik
          Expanded(
            child: _getPage(selectedTab),
          ),
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: AColors.mainGrey,
      elevation: 0,
      title: Text(
        "Menu",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18 ,
          fontWeight: FontWeight.w400,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.person_2_outlined,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  // Sekmeye göre sayfa seçimi
  Widget _getPage(String tab) {
    switch (tab) {
      case "All":
        return MenuAllPage();
      case "Featured":
        return MenuFeaturedPage();
      case "Favorites":
        return MenuFavoritesPage();
      case "Order":
        return MenuOrderPage();
      default:
        return Center(child: Text("Unknown Page"));
    }
  }
}
