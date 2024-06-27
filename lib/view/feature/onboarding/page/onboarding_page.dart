
import 'package:door_care/bloc/onboarding_bloc/onboarding_bloc.dart';
import 'package:door_care/view/feature/onboarding/widget/onboarding_content_widget.dart';
import 'package:flutter/material.dart';

import '../../../../data/const/onboarding_model_list.dart';
import '../widget/onboarding_round_widget.dart';
import '../widget/onboarding_skip_widgt.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _pageController;
  final OnboardingBloc onboardingBloc = OnboardingBloc();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    onboardingBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.15,
            child: Stack(
              children: [
                const OnboardingRoundWidget(),
                OnboardingSkipWidget(onboardingBloc: onboardingBloc),
              ],
            ),
          ),
          Expanded(
            child: NewWidget(
                pageController: _pageController,
                onboardingBloc: onboardingBloc),
          ),
        ],
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
    required PageController pageController,
    required this.onboardingBloc,
  }) : _pageController = pageController;

  final PageController _pageController;
  final OnboardingBloc onboardingBloc;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: _pageController,
        itemCount: 3,
        onPageChanged: (value) =>
            onboardingBloc.add(ScrollOnboardingEvent(index: value)),
        itemBuilder: (context, value) {
          if (value == 0) {
            return OnboardingContentWidget(
              image: OnboardingModelList.list[value].image,
              title: OnboardingModelList.list[value].title,
              subtitle: OnboardingModelList.list[value].subtitle,
              onboardingBloc: onboardingBloc,
            );
          } else if (value == 1) {
            return OnboardingContentWidget(
              image: OnboardingModelList.list[value].image,
              title: OnboardingModelList.list[value].title,
              subtitle: OnboardingModelList.list[value].subtitle,
              onboardingBloc: onboardingBloc,
            );
          } else if (value == 2) {
            return OnboardingContentWidget(
              image: OnboardingModelList.list[value].image,
              title: OnboardingModelList.list[value].title,
              subtitle: OnboardingModelList.list[value].subtitle,
              onboardingBloc: onboardingBloc,
            );
          }
          return null;
        });
  }
}
