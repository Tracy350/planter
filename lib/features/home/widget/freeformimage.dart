import 'package:flutter/material.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class WaterfallGallery extends StatelessWidget {
  final List<String> images = [
    'assets/homeimg.png',
    'assets/plant1.jpg',
    'assets/plant2.jpg',
    'assets/plant3.jpg',
    'assets/plant4.jpg',
    'assets/range1.png',
    'assets/range2.png',
    'assets/range3.png',
    'assets/range1.png',
  ];

  @override
  Widget build(BuildContext context) {
    return 
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: WaterfallFlow.builder(
          gridDelegate: const SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 images per row
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            return _buildImageCard(images[index], index);
          },
        ),
      );
  }

  Widget _buildImageCard(String imagePath, int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
height: [150.0, 200.0, 250.0, 180.0, 220.0, 260.0, 140.0, 190.0, 210.0][index % 9],
      ),
    );
  }
}
