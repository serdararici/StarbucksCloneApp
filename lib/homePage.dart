import 'package:flutter/material.dart';
import 'package:starbucks_clone_app/constants/colors.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // AppBar'ın body'si üzerinde olmasını sağlar
      appBar: AppBar(
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

                  },
                  icon: Icon(Icons.person_2_outlined,color: Colors.white,)
              ),
            ],
          ),
        ],
      ),
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
                  color: Colors.grey[900],
                  child: Padding(
                    padding: const EdgeInsets.only(top: 160),
                    child: Column(
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
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.network(
                                'https://www.pngall.com/wp-content/uploads/4/Starbucks-Coffee-PNG-Image.png',
                                width: 120,
                                height: 80,
                                fit: BoxFit.fill,
                              ),
                            ),
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
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // DraggableScrollableSheet
                DraggableScrollableSheet(
                  initialChildSize: 0.68, // İlk açıldığında ekranın 3'te 2'i kadar
                  minChildSize: 0.68, // Minimum açık hali
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
                        padding: EdgeInsets.only(left: 15, right: 15, top: 25, bottom: 25),
                        children: [
                          Card(
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
                          ),
                          SizedBox(height: 30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Have you tried these?",
                                style:TextStyle(
                                    color: AColors.orange,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "All",
                                    style: TextStyle(
                                      color: AColors.primaryGreen,
                                      fontSize: 16,
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
                          ),
                          SizedBox(height: 10,),
                          Container(
                            height: 150,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal, // Yatay kaydırma yönü
                              itemCount: 10, // Toplam eleman sayısı
                              separatorBuilder: (context, index) => const SizedBox(width: 10,),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    ClipOval(
                                      child: Container(
                                        width: 80,
                                        height: 85,
                                        color: AColors.darkGreen,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Item ${index + 1}', // Yazı
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Campaigns",
                                style:TextStyle(
                                    color: AColors.orange,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "All",
                                    style: TextStyle(
                                      color: AColors.primaryGreen,
                                      fontSize: 16,
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
                          ),
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
}

