import 'package:door_care/view/feature/booking/page/booking.dart';
import 'package:door_care/view/feature/home/page/home.dart';
import 'package:door_care/view/theme/color/app_color.dart';
import 'package:flutter/material.dart';

class HomeNavigationMenu extends StatefulWidget {
  const HomeNavigationMenu({super.key});

  @override
  State<HomeNavigationMenu> createState() => _HomeNavigationMenuState();
}

class _HomeNavigationMenuState extends State<HomeNavigationMenu> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomePage(),
    const BookingPage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: AppColor.primary,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded),
            label: '',
          ),
        ],
      ),
    );
  }
}
