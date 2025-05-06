import 'package:flourish/auth/screens/sign_up.dart';
import 'package:flourish/models/usermodels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80); // AppBar height

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final List<bool> _isHovering = [false, false, false, false];

  /// List of page routes
  final List<String> _routes = [
    "/home",
    "/shop",
    "/about",
    "/contact",
  ];

  /// Navigation function
  void _navigateToPage(int index) {
    Navigator.pushNamed(context, _routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return screenSize.width >= 600
        ? _buildDesktopNavBar(screenSize) // Desktop Navbar
        : _buildMobileDrawer(screenSize); // Mobile Drawer
  }

  /// **Desktop Navigation Bar**
  Widget _buildDesktopNavBar(Size screenSize) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          // **Logo (Navigates to Home)**
          InkWell(
            onTap: () => Navigator.pushNamed(context, "/home"),
            child: Image.asset("assets/fulllogo.png", height: 40),
          ),

          const Spacer(),

          // **Navigation Items**
          Row(
            children: List.generate(
              _routes.length,
              (index) => Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: screenSize.width / 60),
                child: _buildNavItem(
                    ["Home", "Shop", "About", "Contact"][index], index),
              ),
            ),
          ),

          const Spacer(),

          // **Icons with Navigation**
          Row(
            children: [
              _buildIcon(Icons.person, "/profile"),
              SizedBox(width: screenSize.width / 60),
              _buildIcon(Icons.search, "/search"),
              SizedBox(width: screenSize.width / 60),
              _buildIcon(Icons.favorite_border, "/wishlist"),
              SizedBox(width: screenSize.width / 60),
              _buildIcon(Icons.shopping_cart_outlined, "/cart"),
            ],
          ),
        ],
      ),
    );
  }

  /// **Reusable Icon Widget for Navigation**
  Widget _buildIcon(IconData icon, String route) {
    return IconButton(
      icon: Icon(icon, color: Colors.black54),
      onPressed: () {
        final userModel = Provider.of<UserModel?>(context, listen: false);

        if (icon == Icons.person) {
          // Check if user is signed in
          if (userModel == null) {
            // If not signed in, navigate to sign up/sign in page
       Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignUpScreen(toggleView: ,), // Your sign-up page
              ),
            );
          } else {
            // If signed in, navigate to the profile page
            Navigator.pushNamed(context, '/profile');
          }
        } else {
          // For other icons, navigate as usual
          Navigator.pushNamed(context, route);
        }
      },
    );
  }

  /// **Mobile Drawer Navigation**
  Widget _buildMobileDrawer(Size screenSize) {
    return AppBar(
      automaticallyImplyLeading: false, // prevent default back/hamburger icon
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
          const Spacer(),
          Image.asset(
            "assets/fulllogo.png",
            height: 40,
          ),
          const Spacer(flex: 2), // Push logo toward center
        ],
      ),
    );
  }

  /// **Navigation Item with Hover Effect**
  Widget _buildNavItem(String text, int index) {
    return InkWell(
      onHover: (hovering) => setState(() => _isHovering[index] = hovering),
      hoverColor: Colors.transparent,
      onTap: () => _navigateToPage(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: _isHovering[index] ? Colors.blue : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}

/// **Drawer Widget for Mobile**
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Image.asset("assets/fulllogo.png", height: 60),
          ),
          _buildDrawerItem(context, "Home", "/home"),
          _buildDrawerItem(context, "Shop", "/shop"),
          _buildDrawerItem(context, "About", "/about"),
          _buildDrawerItem(context, "Contact", "/contact"),
          _buildDrawerItem(context, "Profile", "/profile"),
        ],
      ),
    );
  }

  /// **Drawer Navigation Items**
  Widget _buildDrawerItem(BuildContext context, String title, String route) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontSize: 18)),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}
