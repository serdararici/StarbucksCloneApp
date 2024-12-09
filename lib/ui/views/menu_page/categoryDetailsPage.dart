import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:starbucks_clone_app/data/entity/menuCategory.dart';

import '../../../constants/colors.dart';
import '../../../data/entity/menu.dart';

class CategoryDetailsPage extends StatefulWidget {

  final MenuCategory category;

  // Constructor ile nesneyi alıyoruz
  const CategoryDetailsPage({Key? key, required this.category}) : super(key: key);

  @override
  State<CategoryDetailsPage> createState() => _CategoryDetailsPageState();
}

class _CategoryDetailsPageState extends State<CategoryDetailsPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: _appBar(context),
      backgroundColor: Colors.white,
      //body: DynamicGridView(menuItems: filteredMenu),
      body: FutureBuilder<List<Menu>>(
        future: getMenuItemsByCategory(widget.category.categoryName), // Firestore'dan veriyi çeken fonksiyon
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Yükleniyor animasyonu
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}')); // Hata durumu
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No menu items found.')); // Veri yok durumu
          } else {
            // Veri mevcut, listeyi göster
            List<Menu> menuItems = snapshot.data!;
            return DynamicGridView(menuItems: menuItems);
          }
        },
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: AColors.mainGrey,
      elevation: 0,
      title: Text("${widget.category.categoryName}",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w400
        ),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new, // Beyaz ok simgesi
          color: Colors.white, // Beyaz renk
          size: 20,
        ),
        onPressed: () {
          Navigator.pop(context); // Geri gitmek için
        },
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
}

class DynamicGridView extends StatelessWidget {

  final List<Menu> menuItems; // Menü öğeleri parametre olarak alınıyor

  DynamicGridView({required this.menuItems});


  @override
  Widget build(BuildContext context) {

    // Ekran genişliğini alıyoruz
    double screenWidth = MediaQuery.of(context).size.width;

    // Sabit bir öğe boyutu belirliyoruz
    double itemSize = 180.0;

    // Satırda kaç öğe olacağını hesaplıyoruz
    int crossAxisCount = (screenWidth / itemSize).floor();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount, // Dinamik olarak hesaplanan öğe sayısı
          crossAxisSpacing: 20.0, // Itemlar arasındaki yatay boşluk
          mainAxisSpacing: 40.0, // Itemlar arasındaki dikey boşluk
        ),
        itemCount: menuItems.length, // Kaç adet öğe göstereceğimiz
        itemBuilder: (context, index) {
          Menu menu = menuItems[index];
          return Container(
            width: itemSize, // Sabit genişlik
            height: itemSize, // Sabit yükseklik
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  width: itemSize - itemSize/5,
                  height: itemSize - itemSize/5,
                  decoration: BoxDecoration(
                    color: AColors.primaryGreen, // Yeşil renk
                    shape: BoxShape.circle, // Yuvarlak şekil
                  ),
                  child: ClipOval(
                    child: Image.network(
                      menu.iconPath, // Görsel URL'si
                      fit: BoxFit.cover, // Görseli kaplamak için
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                  menu.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,  // Üç nokta ekler
                  maxLines: 1,  // Metin tek satıra sığacak şekilde ayarlanır
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
