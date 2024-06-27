import 'package:door_care/bloc/onboarding_bloc/onboarding_bloc.dart';
import 'package:flutter/material.dart';

import '../../../theme/color/app_color.dart';

class OnboardingContentWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final OnboardingBloc onboardingBloc;
  const OnboardingContentWidget({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onboardingBloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Column(
            children: [
              const Spacer(flex: 30),
              Image.asset(
                image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const Spacer(flex: 5),
              Center(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Colors.black,
                    ),
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 10),
              GestureDetector(
                onTap: () {},
                child: Material(
                  shape: const CircleBorder(),
                  color: AppColor.primary,
                  child: IconButton(
                    icon: const Icon(
                      Icons.chevron_right_rounded,
                      size: 35,
                      color: AppColor.background,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              const Spacer(flex: 20),
            ],
          ),
        ],
      ),
    );
  }
}
