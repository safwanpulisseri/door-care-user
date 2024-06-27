import 'dart:developer';

import 'package:door_care/view/feature/auth/page/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/onboarding_bloc/onboarding_bloc.dart';
import '../../../theme/color/app_color.dart';

class OnboardingSkipWidget extends StatelessWidget {
  const OnboardingSkipWidget({
    super.key,
    required this.onboardingBloc,
  });

  final OnboardingBloc onboardingBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      bloc: onboardingBloc,
      builder: (context, state) {
        if (state is OnboardingInitial) {
          if (state.index < 2) {
            return Positioned(
              top: 5.0,
              right: 5.0,
              child: SafeArea(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  // Slightly higher opacity for layering effect

                  child: ElevatedButton(
                    onPressed: () {
                      log("${state.index}");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.toneOne,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Text(
                      'Skip',
                      style: TextStyle(color: AppColor.secondary),
                    ),
                  ),
                ),
              ),
            );
          }
        }
        return const SizedBox.shrink();
      },
    );
  }
}
