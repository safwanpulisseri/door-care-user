import 'package:door_care/core/theme/color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';
import '../const/onboarding_model_list.dart';
import 'package:door_care/feature/onboarding/view/model/onboarding_model.dart';

import '../../../auth/view/page/sign_in_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Onboarding(
          swipeableBody: OnboardingModelList.list.map((model) {
            return OnboardingPage(model: model);
          }).toList(),
          startIndex: 0,
          onPageChanges:
              (netDragDistance, pagesLength, currentIndex, slideDirection) {
            setState(() {
              this.currentIndex = currentIndex;
            });
          },
          buildHeader: (context, netDragDistance, pagesLength, currentIndex,
              setIndex, slideDirection) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (currentIndex < 2)
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInPage()),
                          );
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
                ],
              ),
            );
          },
          buildFooter: (context, netDragDistance, pagesLength, currentIndex,
              setIndex, slideDirection) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: currentIndex == pagesLength - 1
                  ? ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primary,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text(
                        "Get Started",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )
                  : Center(
                      child: GestureDetector(
                        onTap: () {
                          setIndex(currentIndex + 1);
                        },
                        child: Material(
                          shape: const CircleBorder(),
                          color: AppColor.primary,
                          child: IconButton(
                            icon: const Icon(
                              Icons.chevron_right_rounded,
                              size: 35,
                              color: AppColor.background,
                            ),
                            onPressed: () {
                              setIndex(currentIndex + 1);
                            },
                          ),
                        ),
                      ),
                    ),
            );
          },
          animationInMilliseconds: 500,
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final OnboardingModel model;

  const OnboardingPage({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      color: AppColor.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            model.image,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          Text(
            model.title,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 30,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            model.subtitle,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Colors.black,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
