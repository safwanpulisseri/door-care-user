import 'package:door_care/view/feature/onboarding/page/onboarding_page.dart';
import 'package:door_care/view/theme/color/app_color.dart';
import 'package:door_care/view/util/svg_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).whenComplete(() {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => OnboardingPage(),
          ),
          (route) => false);
    });
    return Scaffold(
      backgroundColor: AppColor.splash,
      body: SafeArea(
          child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  Spacer(flex: 4),
                  SvgPicture.asset(AppSvgPath.splashLogo),
                  Spacer(
                    flex: 1,
                  )
                ],
              ))),
    );
  }
}
