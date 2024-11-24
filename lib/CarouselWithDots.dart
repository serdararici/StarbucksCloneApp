import 'package:flutter/material.dart';
import 'package:starbucks_clone_app/constants/colors.dart';

class CarouselWithDots extends StatefulWidget {
  @override
  _CarouselWithDotsState createState() => _CarouselWithDotsState();
}

class _CarouselWithDotsState extends State<CarouselWithDots> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.toInt() ?? 0; // Sayfa değiştikçe güncellenir
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          child: PageView.builder(
            controller: _pageController,
            itemCount: 10, // Görüntülemek istediğiniz eleman sayısı
            itemBuilder: (context, index) {
              return Container(
                width: 80, // Yuvarlak boyutları
                height: 80,
                decoration: BoxDecoration(
                  color: AColors.darkGreen,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                    child: Text("Item ${index+1}",
                        style: TextStyle(color: Colors.white))),
              );
            },
          ),
        ),
        SizedBox(height: 20), // Yukarıdaki ListView ile aşağıdaki noktalar arasına boşluk
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            10, // Aynı sayıda nokta olacak
                (index) => AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 5),
              width: _currentPage == index ? 8 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: _currentPage == index ? AColors.lightOrange : Colors.grey[300],
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
