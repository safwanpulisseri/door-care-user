import 'package:door_care/view/feature/booking/page/booking.dart';
import 'package:door_care/view/feature/home/page/home.dart';
import 'package:flutter/material.dart';

class HomeNavigationMenu extends StatelessWidget {
  HomeNavigationMenu({super.key});

  final List<Widget> _page = [const HomePage(), const BookingPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[0],
      bottomNavigationBar: BottomNavigationBar(
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
