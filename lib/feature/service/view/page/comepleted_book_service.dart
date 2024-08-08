import 'package:flutter/material.dart';

import '../../../navigation_menu/page/home_navigation_menu.dart';
import '../widget/bottom_app_bar_widget.dart';
import 'enter_details_book_service.dart';

class CompletedBookService extends StatelessWidget {
  const CompletedBookService({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Comepleted'),
      ),
      // bottomNavigationBar: BottomAppBarWidget(
      //   leftButtonText: 'Cancel',
      //   rightButtonText: 'Continue',
      //   onLeftButtonPressed: () {
      //     Navigator.pushAndRemoveUntil(
      //       context,
      //       MaterialPageRoute(builder: (_) => HomeNavigationMenu()),
      //       (route) => false,
      //     );
      //   },
      //   onRightButtonPressed: () {
      //     Navigator.pushAndRemoveUntil(
      //       context,
      //       MaterialPageRoute(builder: (_) => HomeNavigationMenu()),
      //       (route) => false,
      //     );
      //   },
      // ),
    );
  }
}
