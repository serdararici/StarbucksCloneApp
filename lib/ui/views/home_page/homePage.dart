import 'package:flutter/material.dart';
import 'package:starbucks_clone_app/CarouselWithDots.dart';
import 'package:starbucks_clone_app/ui/views/home_page/widgets/listViewBrandCollaborations.dart';
import 'package:starbucks_clone_app/constants/colors.dart';
import 'package:starbucks_clone_app/ui/views/home_page/widgets/listViewCampaigns.dart';
import 'package:starbucks_clone_app/ui/views/home_page/widgets/listViewSocialResponsibility.dart';
import 'package:starbucks_clone_app/ui/views/home_page/widgets/semiCircularChart.dart';

import '../settings_page/settings_page.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> items = [
      {'title': 'Toffee \n Nut Latte', 'iconPath': 'https://www.digitalassets.starbucks.eu/sites/starbucks-medialibrary/files/SBX-MOP-1500x1500-Toffee-Nut-Latte.jpeg'},
      {'title': 'Toffee Nut \n Cream Cold \n Brew', 'iconPath': 'https://www.starbucks.co.uk/_next/image?url=https%3A%2F%2Fwww.digitalassets.starbucks.eu%2Fsites%2Fstarbucks-medialibrary%2Ffiles%2FToffee-Nut-Cream-Cold-Brew-.jpeg&w=3840&q=75'},
      {'title': 'Toffee Nut \n Frappuccino', 'iconPath': 'https://www.digitalassets.starbucks.eu/sites/starbucks-medialibrary/files/SBX-MOP-1500x1500-Toffee-Nut-Frappuccino.jpeg'},
      {'title': 'Gingerbread \n Latte', 'iconPath': 'https://globalassets.starbucks.com/digitalassets/products/bev/GingerbreadLatte.jpg?impolicy=1by1_wide_topcrop_630'},
      {'title': 'Gingerbread \n Frappuccino', 'iconPath': 'https://www.digitalassets.starbucks.eu/sites/starbucks-medialibrary/files/SBX-MOP-1500x1500-Gingerbread-Frappuccino.jpeg'},
    ];
    return Scaffold(
      extendBodyBehindAppBar: true, // AppBar'ın body'si üzerinde olmasını sağlar
      appBar: _AppBar(), ///
      body:
      CustomScrollView(
        slivers: [
          // Üstteki SliverAppBar
          SliverFillRemaining(
            child: Stack(
              children: [
                // Ana içerik
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: AColors.mainGrey,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 140),
                    child: _topBody(),  ///
                  ),
                ),
                // DraggableScrollableSheet
                DraggableScrollableSheet(
                  initialChildSize: 0.63, // İlk açıldığında ekranın 3'te 2'i kadar
                  minChildSize: 0.63, // Minimum açık hali
                  maxChildSize: 0.88, // Maksimum açık hali
                  builder: (BuildContext context, ScrollController scrollController) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF4F4F4),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      child: ListView(
                        controller: scrollController, // ScrollController bağlanıyor
                        padding: EdgeInsets.only(left: 16, right: 16, top: 25, bottom: 25),
                        children: [
                          _cardAddMoney(context),
                          SizedBox(height: 30,),
                          ListViewTitleRow(title: 'Have you tried these?'),
                          SizedBox(height: 10,),
                          Container(
                            height: 150,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal, // Yatay kaydırma yönü
                              itemCount: items.length, // Liste uzunluğu kadar eleman
                              separatorBuilder: (context, index) => const SizedBox(width: 10,),
                              itemBuilder: (context, index) {
                                // item listesindeki her bir elemanı işliyoruz
                                var item = items[index];
                                return Column(
                                  children: [
                                    ClipOval(
                                      child: Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(item['iconPath']!), // Resim yolu
                                            fit: BoxFit.cover, // Görüntü dolgusunu sağlıyoruz
                                          ),
                                          color: AColors.darkGreen, // Yedek bir renk
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      item['title']!, // title'ı burada yazıyoruz
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 20,),
                          ListViewTitleRow(title: 'Campaigns',),
                          SizedBox(height: 15,),
                          ListViewCampaigns(),
                          SizedBox(height: 60,),
                          ListViewTitleRow(title: 'Brand Collaborations'),
                          SizedBox(height: 15,),
                          ListViewBrandCollaborations(),
                          SizedBox(height: 60,),
                          ListViewTitleRow(title: 'Social Responsibility'),
                          SizedBox(height: 15,),
                          ListViewSocialResponsibility(),
                          SizedBox(height: 60,),
                          _cardStarbucksDelivery(),


                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Card _cardStarbucksDelivery() {
    return Card(
      color: Colors.white,
      elevation: 1, // Gölgelendirme
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Köşelerin yuvarlatılması
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipOval(
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Color(0xFFB2DFDB),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          'assets/images/starbucks_delivery_scooter.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Starbucks® Delivers",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AColors.orange,
                      ),
                    ),
                    SizedBox(height: 2,),
                    Text("Coffee & Food delivery",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    ClipOval(
                      child: Container(
                        width: 70,
                        height: 70,
                        color: Colors.white,
                        child: Center(
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                "assets/images/getirYemek.png",
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Getir Yemek', // Yazı
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ClipOval(
                      child: Container(
                        width: 70,
                        height: 70,
                        color: Colors.white,
                        child: Center(
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                "assets/images/yemeksepeti.png",
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Yemek Sepeti', // Yazı
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ClipOval(
                      child: Container(
                        width: 70,
                        height: 70,
                        color: Colors.white,
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset(
                              "assets/images/starbucks.png",
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Shayakahve', // Yazı
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ClipOval(
                      child: Container(
                        width: 70,
                        height: 70,
                        color: Colors.white,
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset(
                              "assets/images/hepsiburada.png",
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Hepsiburada', // Yazı
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Card _cardAddMoney(BuildContext context) {
    return Card(
      //margin: EdgeInsets.only(left: 10, right: 10),
      color: Colors.white,
      elevation: 1, // Gölgelendirme
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Köşelerin yuvarlatılması
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              width: 130,
              height: 28,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: AColors.primaryGreen,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                "GREEN MEMBER",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,

                ),
              ),
            ),
            SizedBox(height: 10,),
            Text(
              "Identify your credit/debit card to add money to\nyour account",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    'https://globalassets.starbucks.com/digitalassets/cards/fy20/BrailleFY20.jpg',
                    width: 100,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Account balance",
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    Text("16,25 ₺",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(
                  MediaQuery.of(context).size.width * 0.9, // Ekranın %80'i kadar genişlik
                  40, // Sabit yükseklik
                ),
                foregroundColor: Colors.white,
                backgroundColor: AColors.primaryGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 0,
              ),

              onPressed: (){},
              child: Text(
                textAlign: TextAlign.center,
                "ADD MONEY",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _topBody() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.zero,
              width: 100,
              height: 110,
              //color: Colors.blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Star Balance",
                    style: TextStyle(
                      color: AColors.lightOrange,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Icon(Icons.star,color: AColors.lightOrange,
                      size: 30,),
                      SizedBox(width: 5,),
                      Text(
                        "23"
                        ,style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Text("1 reward drink",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            SemiCircularChart(total: 15, completed: 8),
            Container(
              width: 100,
              height: 110,
              //color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Badges",
                    style: TextStyle(
                      color: AColors.lightOrange,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AColors.primaryGreen,
                    ),
                    child: Center(
                      child: Icon(Icons.star,color: Colors.white,),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  AppBar _AppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text("Good evening Serdar ☕",
        style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w300
        ),
      ),
      actions: [
        Row(
          children: [
            IconButton(
                onPressed: (){

                },
                icon: Icon(Icons.notifications_none_outlined,color: Colors.white,)
            ),
            IconButton(
                onPressed: (){
                  Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) => SettingsPage(),
                    ),
                  );
                },
                icon: Icon(Icons.person_2_outlined,color: Colors.white,)
            ),
          ],
        ),
      ],
    );
  }
}

class ListViewTitleRow extends StatelessWidget {
  final String title; // Parametre eklendi

  const ListViewTitleRow({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style:TextStyle(
              color: AColors.orange,
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: (){

              },
              child: Text(
                "All",
                style: TextStyle(
                  color: AColors.primaryGreen,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(width: 5,),
            Icon(Icons.east,
              size: 15,
              color: AColors.primaryGreen,
            ),
          ],
        ),
      ],
    );
  }
}

