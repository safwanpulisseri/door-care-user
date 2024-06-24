import 'package:flutter/widgets.dart';

import '../../../theme/color/app_color.dart';

class OnboardingRoundWidget extends StatelessWidget {
  const OnboardingRoundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -55.0,
      left: -55.0,
      child: Container(
        width: 150.0,
        height: 150.0,
        decoration: const BoxDecoration(
          color: AppColor.toneTwo,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
