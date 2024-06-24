import 'package:door_care/view/theme/color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../onboarding/widget/cutom_elevated_button.dart';

class OtpVerificationPage extends StatelessWidget {
  const OtpVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        color: AppColor.primary,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColor.secondary),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColor.primary),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: AppColor.primary.withOpacity(0.1),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  'Verification code',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: AppColor.secondary,
                        fontSize: 40,
                      ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'We just sent you a verify code.\nCheck your email/inbox to get them.',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: AppColor.secondary,
                        fontSize: 17,
                      ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            const SizedBox(height: 32),
            Pinput(
              length: 6,
              // defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              showCursor: true,
              onChanged: (value) {
                // Handle the OTP input
              },
            ),
            const SizedBox(height: 32),
            CustomElevatedButton(
              onPressed: () {},
              text: 'Continue',
              fontSize: 18,
              width: double.infinity,
              height: 50,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Re-send code in ',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: AppColor.secondary,
                        fontSize: 18,
                      ),
                ),
                Text(
                  '0:20',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: AppColor.primary,
                        fontSize: 18,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



// void main() {
//   runApp(MaterialApp(
//     home: OtpVerificationPage(),
//   ));
// }
