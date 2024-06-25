import 'package:door_care/view/feature/booking/tabs/committed_tab.dart';
import 'package:door_care/view/feature/booking/tabs/completed_tab.dart';
import 'package:door_care/view/feature/booking/tabs/pending_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../theme/color/app_color.dart';
import '../../../widget/opacity_container.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Row(
            children: [
              OpacityContainer(),
            ],
          ),
        ),
        title: Text(
          'Bookings',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: AppColor.secondary,
                fontSize: 30,
              ),
        ),
        backgroundColor: AppColor.background,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            color: AppColor.background,
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              tabs: [
                _buildSegment('Pending', 0),
                _buildSegment('Committed', 1),
                _buildSegment('Completed', 2),
                // Tab(
                //   text: 'Pending',
                // ),
                // Tab(
                //   text: 'Committed',
                // ),
                // Tab(
                //   text: 'Completed',
                // )
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          TabScreenOne(),
          TabScreenTwo(),
          TabScreenThree(),
        ],
      ),
    );
  }

  Widget _buildSegment(String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
          _tabController.animateTo(index);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: _selectedIndex == index
              ? AppColor.primary.withOpacity(0.1)
              : Colors.transparent,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Text(
          text,
          style: TextStyle(
            color:
                _selectedIndex == index ? AppColor.primary : AppColor.toneThree,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
