import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselIndicator extends StatelessWidget {
  const CarouselIndicator({
    super.key,
    required this.listImage,
    required this.carouselController,
    required this.currentImage,
  });

  final List<Widget> listImage;
  final CarouselController carouselController;
  final int currentImage;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: listImage.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => carouselController.animateToPage(entry.key),
            child: Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(currentImage == entry.key ? 0.6 : 0.2),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
