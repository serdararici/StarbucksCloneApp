import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';
import '../../../../data/entity/socialResponsibility.dart';


class ListViewSocialResponsibility extends StatefulWidget {
  final List<SocialResponsibility> socialResponsibilityItems;

  const ListViewSocialResponsibility({Key? key, required this.socialResponsibilityItems})
      : super(key: key);

  @override
  _ListViewSocialResponsibilityState createState() =>
      _ListViewSocialResponsibilityState(
        socialResponsibilityItems: socialResponsibilityItems,
      );
}

class _ListViewSocialResponsibilityState
    extends State<ListViewSocialResponsibility> {
  final ScrollController _scrollController = ScrollController();
  final List<SocialResponsibility> socialResponsibilityItems;
  int _currentPage = 0;
  final double _itemWidth = 350;
  final double _separatorWidth = 10;
  late int _visibleDots;

  _ListViewSocialResponsibilityState({required this.socialResponsibilityItems});

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

    _visibleDots = socialResponsibilityItems.length > 5 ? 5 : socialResponsibilityItems.length;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Social Responsibility List
        Container(
          height: 350,
          child: ListView.separated(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: socialResponsibilityItems.length,
            itemBuilder: (context, index) {
              final item = socialResponsibilityItems[index];
              return Container(
                width: _itemWidth,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    item.iconPath,
                    fit: BoxFit.cover,
                    width: double.infinity,
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
                    errorBuilder: (context, error, stackTrace) =>
                    const Center(
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
          children: List.generate(socialResponsibilityItems.length, (index) {
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
