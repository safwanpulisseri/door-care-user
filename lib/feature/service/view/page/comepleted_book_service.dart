import 'package:door_care/feature/navigation_menu/page/home_navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/theme/color/app_color.dart';
import '../widget/bottom_app_bar_widget.dart';
import '../widget/circle_avathar_widget.dart';

class CompletedBookService extends StatelessWidget {
  const CompletedBookService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Column(
          children: [
            StepperWidget(
              titleOne: 'Location',
              titleTwo: 'Details',
              titleThree: 'Success',
              titleColorOne: AppColor.toneThree,
              titleColorTwo: AppColor.toneThree,
              titleColorThree: AppColor.secondary,
              circleColorOne: AppColor.toneFive,
              circleColorTwo: AppColor.toneFive,
              circleColorThree: AppColor.primary,
              iconOne: Icon(
                FontAwesomeIcons.check,
                color: AppColor.background,
              ),
              iconTwo: Icon(
                FontAwesomeIcons.check,
                color: AppColor.background,
              ),
              iconThree: Icon(
                FontAwesomeIcons.check,
                color: AppColor.background,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 300),
              child: Center(
                child: Text(
                  'Your booking has been initiated successfully.\nPlease wait for the worker\'s approval.',
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColor.secondary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBarWidget(
        leftButtonText: 'Cancel',
        rightButtonText: 'Continue',
        onLeftButtonPressed: () {
          //
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => HomeNavigationMenu()),
            (route) => false,
          );
        },
        onRightButtonPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => HomeNavigationMenu()),
            (route) => false,
          );
        },
      ),
    );
  }
}
