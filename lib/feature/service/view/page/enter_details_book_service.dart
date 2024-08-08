import 'package:flutter/material.dart';
import '../../../navigation_menu/page/home_navigation_menu.dart';
import '../widget/bottom_app_bar_widget.dart';
import 'comepleted_book_service.dart';

class EnterDetailsBookService extends StatelessWidget {
  const EnterDetailsBookService({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Details'),
      ),
      // bottomNavigationBar: BottomAppBarWidget(
      //   leftButtonText: 'Cancel',
      //   rightButtonText: 'Confirm Booking',
      //   onLeftButtonPressed: () {
      //     Navigator.pushAndRemoveUntil(
      //       context,
      //       MaterialPageRoute(builder: (_) => HomeNavigationMenu()),
      //       (route) => false,
      //     );
      //   },
      //   onRightButtonPressed: () {
      //     Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //             builder: (context) => const ComepletedBookService()));
      //   },
      // ),
    );
  }
}
