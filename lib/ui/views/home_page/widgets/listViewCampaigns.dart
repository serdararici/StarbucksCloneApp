import 'package:flutter/material.dart';
import 'package:starbucks_clone_app/data/entity/campaigns.dart';

import '../../../../constants/colors.dart';

class ListViewCampaigns extends StatefulWidget {
  final List<Campaigns> campaignsItems; // Kampanya listesini alacak

  const ListViewCampaigns({Key? key, required this.campaignsItems})
      : super(key: key);

  @override
  _ListViewCampaignsState createState() =>
      _ListViewCampaignsState(campaignsItems: campaignsItems);
}


class _ListViewCampaignsState extends State<ListViewCampaigns> {
  final ScrollController _scrollController = ScrollController();
  final List<Campaigns> campaignsItems; // Kampanya verileri bu listeden alınacak
  int _currentPage = 0;
  final double _itemWidth = 350;
  final double _separatorWidth = 10;
  late int _visibleDots;

  _ListViewCampaignsState({required this.campaignsItems});

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

    _visibleDots = campaignsItems.length > 5 ? 5 : campaignsItems.length;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Kampanya Listesi
        Container(
          height: 350,
          child: ListView.separated(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: campaignsItems.length,
            itemBuilder: (context, index) {
              final campaign = campaignsItems[index];
              return Container(
                width: _itemWidth,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    campaign.iconPath, // Verilerden gelen görsel URL'si
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => const Center(
                      child: Icon(Icons.error, size: 50, color: Colors.red),
                    ),
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
          children: List.generate(campaignsItems.length, (index) {
            int middleStart = _currentPage - (_visibleDots ~/ 2);
            int middleEnd = _currentPage + (_visibleDots ~/ 2);

            double size;
            if (index >= middleStart && index <= middleEnd) {
              size = 8.0;
            } else {
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

