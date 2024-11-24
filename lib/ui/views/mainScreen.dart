import 'package:flutter/material.dart';
import 'package:starbucks_clone_app/constants/colors.dart';
import 'package:starbucks_clone_app/ui/views/gift_page/giftPage.dart';
import 'package:starbucks_clone_app/ui/views/home_page/homePage.dart';
import 'package:starbucks_clone_app/ui/views/menu_page/menuPage.dart';
import 'package:starbucks_clone_app/ui/views/stores_page/storesPage.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Homepage(),
    MenuPage(),
    Container(), // FAB için boş bir sayfa
    StoresPage(),
    GiftPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("FAB Clicked!");
        },
        backgroundColor: AColors.primaryGreen,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
        child: Icon(
          Icons.qr_code,
          color: Colors.white,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: AColors.primaryGreen,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            activeIcon: Icon(Icons.star),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.coffee_outlined),
            activeIcon: Icon(Icons.coffee),
            label: "Menu",
          ),
          BottomNavigationBarItem(
            icon: SizedBox.shrink(), // FAB boşluğu için bir yer tutucu
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            activeIcon: Icon(Icons.location_on),
            label: "Stores",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard_outlined),
            label: "Gifts",
          ),
        ],
      ),
    );
  }
}
