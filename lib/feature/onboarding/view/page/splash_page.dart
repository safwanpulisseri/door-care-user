import 'package:door_care/feature/onboarding/view/page/onboarding_home.dart';
import 'package:door_care/core/theme/color/app_color.dart';
import 'package:door_care/core/util/svg_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2)).whenComplete(() {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const OnboardingScreen(),
          ),
          (route) => false);
    });
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const Spacer(flex: 4),
              SvgPicture.asset(AppSvgPath.splashLogo),
              const Spacer(
                flex: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
