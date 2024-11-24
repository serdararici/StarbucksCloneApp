import 'package:flutter/material.dart';
import 'package:starbucks_clone_app/constants/colors.dart';
import 'package:starbucks_clone_app/ui/views/menu_page/categoryDetailsPage.dart';
import 'package:starbucks_clone_app/ui/views/menu_page/pageViewMenuAll.dart';

import 'package:starbucks_clone_app/data/entity/menuCategory.dart';

class MenuAllPage extends StatefulWidget {
  const MenuAllPage({super.key});

  @override
  State<MenuAllPage> createState() => _MenuAllPageState();
}

class _MenuAllPageState extends State<MenuAllPage> {
  @override
  Widget build(BuildContext context) {

    List<MenuCategory> drinksCategories = categories.where((category) => category.type == "drinks").toList();
    List<MenuCategory> foodsCategories = categories.where((category) => category.type == "foods").toList();
    List<MenuCategory> coffeeAtHomeCategories = categories.where((category) => category.type == "coffeeAtHome").toList();
    List<MenuCategory> merchandiseCategories = categories.where((category) => category.type == "merchandise").toList();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            _searchBar(),
            SizedBox(height: 16,),
            _filterButtons(),
            SizedBox(height: 24,),

            // Kaydırılabilir alan
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    PageViewMenuAll(),
                    SizedBox(height: 46),
                    MenuTitleRow(title: "Drinks"),
                    SizedBox(height: 15),
                    CategoryListWidget(categoryList: drinksCategories),
                    SizedBox(height: 15),
                    MenuTitleRow(title: "Foods"),
                    SizedBox(height: 15),
                    CategoryListWidget(categoryList: foodsCategories),
                    SizedBox(height: 15),
                    MenuTitleRow(title: "Coffee At Home"),
                    SizedBox(height: 15),
                    CategoryListWidget(categoryList: coffeeAtHomeCategories),
                    SizedBox(height: 15),
                    MenuTitleRow(title: "Merchandise"),
                    SizedBox(height: 15),
                    CategoryListWidget(categoryList: merchandiseCategories),
                    SizedBox(height: 20,)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _filterButtons() {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 37,
                  decoration: BoxDecoration(
                    color: AColors.mediumGrey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.clear,color: Colors.white),
                      SizedBox(width: 6,),
                      Text("Clear filter",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      )
                    ],
                  )
                ),
              ),
              SizedBox(width: 15,),
              Expanded(
                child: Container(
                    height: 37,
                    decoration: BoxDecoration(
                      color: AColors.secondaryOrange,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.filter_alt_outlined,color: Colors.white),
                        SizedBox(width: 6,),
                        Text("Filters",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    )
                ),
              ),
            ],
          );
  }

  TextField _searchBar() {
    return TextField(
            decoration: InputDecoration(
              hintText: "Search..",
              hintStyle: TextStyle(
                color: Colors.grey
              ),
              prefixIcon: Icon(Icons.search,color: Colors.grey,size: 30,), // Sol tarafta ikon
              filled: true,
              fillColor: AColors.lightGrey, // Arka plan rengi
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10), // Köşe yuvarlatma
                borderSide: BorderSide.none, // Kenarlık kaldırma
              ),
            ),
          );
  }
}

class CategoryListWidget extends StatelessWidget {
  final List<MenuCategory> categoryList;

  const CategoryListWidget({super.key, required this.categoryList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: categoryList.map((category) {
        return Column(
          children: [
            Container(
              height: 60,
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  radius: 30, // Dairenin yarıçapı
                  backgroundColor: AColors.darkGreen, // Dairenin arka plan rengi
                  child: ClipOval(
                    child: Image.network(
                      'https://www.digitalassets.starbucks.eu/sites/starbucks-medialibrary/files/Fresh-Brewed-Coffee---Feb-2023.jpeg', // Görsel URL'si
                      fit: BoxFit.cover,
                      width: 40, // Resmin genişliği
                      height: 40, // Resmin yüksekliği
                    ),
                  ),
                ),
                title: Text(
                  category.categoryName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward, color: Colors.black),
                onTap: () {
                  Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) => CategoryDetailsPage(category: category),
                    ),
                  );
                },
              ),
            ),
            Divider(color: AColors.mediumGrey), // Alt çizgi
          ],
        );
      }).toList(),
    );

  }
}

class MenuTitleRow extends StatelessWidget {
  final String title;

  const MenuTitleRow({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AColors.secondaryOrange,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
