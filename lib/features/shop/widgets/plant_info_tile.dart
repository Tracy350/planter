import 'package:flutter/material.dart';

class PlantInfoTile extends StatelessWidget {
  const PlantInfoTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 400,
      child: Stack(
        children: [
          // Background image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/plantinfo.jpg',
              width: 300,
              height: 400,
              fit: BoxFit.cover,
            ),
          ),

          // Positioned image on edge (bottom right in this case)
          Positioned(
            bottom: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/plantinfo.jpg',
                height: 200,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
