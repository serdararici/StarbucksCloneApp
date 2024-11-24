import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class ListViewCampaigns extends StatefulWidget {
  @override
  _ListViewCampaignsState createState() =>
      _ListViewCampaignsState();
}

class _ListViewCampaignsState extends State<ListViewCampaigns> {
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 0;
  final double _itemWidth = 350;
  final double _separatorWidth = 10;
  final int _visibleDots = 5; // Merkezde aynı anda görünen normal boyutlu noktalar

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        double totalItemWidth = _itemWidth + _separatorWidth;
        double offset = _scrollController.offset;
        _currentPage = (offset / totalItemWidth).round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ListView
        Container(
          height: 350,
          child: ListView.separated(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                width: _itemWidth,
                decoration: BoxDecoration(
                  color: AColors.darkGreen,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    "Item ${index + 1}",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 60),

        // Dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(10, (index) {
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
