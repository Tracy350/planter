import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BannerTile extends StatelessWidget {
  const BannerTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final isMobile = currentWidth < 600;
    return Container(
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior:
          Clip.hardEdge, // ensures the overlay stays within the border radius
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExN3k5bHU2Zm1pd25lZmtpcmtoOXY2NWoybXhnYW9ibDZpZGMxY3JrdyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/xdkXW7Scx6gus/giphy.gif',
            fit: BoxFit.fill,
          ),
          Container(
            color:
                Colors.black.withOpacity(0.5), // Black overlay with 50% opacity
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'CULTIVATING AND NURTURING PLANTS',
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 12 : 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'NURTURING NATURE WITH EVERY POT AND PLANT',
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 20 : 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: isMobile ? 400 : 600,
                    ),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
                      style: GoogleFonts.poppins(
                        fontSize: isMobile ? 12 : 20,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
