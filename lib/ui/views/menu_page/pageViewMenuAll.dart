import 'package:flutter/material.dart';

import '../../../constants/colors.dart';


class PageViewMenuAll extends StatefulWidget {
  @override
  _PageViewMenuAllState createState() => _PageViewMenuAllState();
}

class _PageViewMenuAllState extends State<PageViewMenuAll> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final double _itemWidth = 350;
  final double _separatorWidth = 10;
  final int _itemCount = 1; // Örnek: item sayısını burada belirtiyoruz
  late int _visibleDots;  // _visibleDots başlangıçta null olacak

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });

    // _visibleDots değerini burada hesaplıyoruz
    _visibleDots = _itemCount > 5 ? 5 : _itemCount;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // PageView
        Container(
          height: 200,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _itemCount,
            itemBuilder: (context, index) {
              return Container(
                width: _itemWidth,
                decoration: BoxDecoration(
                  color: AColors.darkGreen,
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Center(
                  child: Image.asset(
                    "assets/images/menu1.JPG",
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 15),

        // Dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_itemCount, (index) {
            // Boyut hesaplama
            int middleStart = _currentPage - (_visibleDots ~/ 2);
            int middleEnd = _currentPage + (_visibleDots ~/ 2);

            double size;
            if (index >= middleStart && index <= middleEnd) {
              size = 8.0; // Normal boyutlu nokta
            } else {
              // Görünmeyen noktalar küçülerek animasyonlanır
              int distance = (index - _currentPage).abs();
              size = 12.0 - (distance * 3.0).clamp(4.0, 6.0);
            }

            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: _currentPage == index ? AColors.orange : Colors.grey[400],
                borderRadius: BorderRadius.circular(5),
              ),
            );
          }),
        ),
      ],
    );
  }
}
