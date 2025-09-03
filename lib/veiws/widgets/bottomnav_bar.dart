import 'package:e_commerce/veiws/screens/detail_screen/detail_screen.dart';
import 'package:e_commerce/veiws/screens/fav_Screen/fav_screen.dart';
import 'package:e_commerce/veiws/screens/home_screen/home_screen.dart';
import 'package:e_commerce/veiws/screens/profile_screen/profile_screen.dart';
import 'package:e_commerce/veiws/screens/shopping_screen/shopping_screen.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    FavouriteScreen(),
    ShoppingScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF2A5298),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
             icon: Image.asset(
              "assets/images/bottam_nav_(5).png",
              height: 24,
              color: Colors.grey,
            ),
            activeIcon: Image.asset(
              "assets/images/bottam_nav_(5).png",
              height: 24,
              color: const Color(0xFF00897B),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
             icon: Image.asset(
              "assets/images/bottam_nav_(6).png",
              height: 24,
              color: Colors.grey,
            ),
            activeIcon: Image.asset(
              "assets/images/bottam_nav_(6).png",
              height: 24,
              color: const Color(0xFF00897B),
            ),
            label: "Favourite",
          ),
          BottomNavigationBarItem(
             icon: Image.asset(
              "assets/images/bottam_nav_(4).png",
              height: 24,
              color: Colors.grey,
            ),
            activeIcon: Image.asset(
              "assets/images/bottam_nav_(4).png",
              height: 24,
              color: const Color(0xFF00897B),
            ),
            label: "Shopping",
          ),
          BottomNavigationBarItem(
              icon: Image.asset(
              "assets/images/bottam_nav_(3).png",
              height: 24,
              color: Colors.grey,
            ),
            activeIcon: Image.asset(
              "assets/images/bottam_nav_(3).png",
              height: 24,
              color: const Color(0xFF00897B),
            ),
            label: "Profile",
         ),
        ],
    ),);
  }
}   