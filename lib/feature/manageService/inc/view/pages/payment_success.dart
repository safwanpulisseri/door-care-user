import 'package:door_care/feature/navigation_menu/page/home_navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../../core/theme/color/app_color.dart';
import '../../../../../core/util/jason_asset.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate to another page after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (ctx) =>
              HomeNavigationMenu(), // Change this to the page you want to navigate to
        ),
      );
    });

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          const Spacer(
            flex: 2,
          ),
          SizedBox(
            height: 200,
            width: 200,
            child: Lottie.asset(
              AppJasonPath.verifyIcon,
              // repeat: false, // Ensure the animation plays only once
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Text(
            "Payment Successful!",
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColor.secondary,
                  fontSize: 27,
                ),
            textAlign: TextAlign.center,
          ),
          const Spacer(
            flex: 1,
          ),
          Text(
            "Your payment was processed successfully. You will be redirected shortly.",
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: AppColor.secondary,
                  fontSize: 16,
                ),
            textAlign: TextAlign.center,
          ),
          const Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }
}
