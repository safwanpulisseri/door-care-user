import 'package:door_care/feature/navigation_menu/page/home_navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/theme/color/app_color.dart';
import '../../bloc/bloc/navigation_bloc.dart';
import '../widget/bottom_app_bar_widget.dart';
import 'comepleted_book_service.dart';
import 'enter_details_book_service.dart';
import 'find_location_book_service.dart';

class HomeStepperWidget extends StatelessWidget {
  HomeStepperWidget({super.key});

  final List<Widget> _pages = [
    const FindLocationBookService(),
    const EnterDetailsBookService(),
    const CompletedBookService(),
  ];

  @override
  Widget build(BuildContext context) {
    // Ensure the StepperNavigationBloc state is initialized to the first page
    //  context.read<StepperNavigationBloc>().add(const PageChangedEvent(0));
    return BlocBuilder<StepperNavigationBloc, StepperNavigationState>(
      builder: (context, state) {
        int selectedIndex = 0;
        if (state is StepperNavigationPageState) {
          selectedIndex = state.pageIndex;
        }
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  color: AppColor.background,
                  height: 80,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: StepperWidget(currentStep: selectedIndex + 1),
                  ),
                ),
                Flexible(child: _pages[selectedIndex]),
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBarWidget(
            leftButtonText: 'Back',
            rightButtonText: 'Next',
            onNavigate: (int step) {
              int newIndex = selectedIndex + step;

              // Navigate to HomePage when back is pressed on the first step
              if (newIndex < 0) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (contex) => HomeNavigationMenu()),
                );
              } else if (newIndex >= _pages.length) {
                // Navigate to HomePage when next is pressed on the last step
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (contex) => HomeNavigationMenu()),
                );
                // Ensure the StepperNavigationBloc state is initialized to the first page
                context
                    .read<StepperNavigationBloc>()
                    .add(const PageChangedEvent(0));
              } else {
                // Navigate within the steps
                context
                    .read<StepperNavigationBloc>()
                    .add(PageChangedEvent(newIndex));
              }
            },
          ),
        );
      },
    );
  }
}

class StepperWidget extends StatelessWidget {
  final int currentStep;

  const StepperWidget({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildStep(
          title: 'Location',
          isActive: currentStep >= 1,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Container(
            height: 3,
            width: 80,
            color: AppColor.toneEight.withOpacity(0.6),
          ),
        ),
        buildStep(
          title: 'Details',
          isActive: currentStep >= 2,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Container(
            height: 3,
            width: 80,
            color: AppColor.toneEight.withOpacity(0.6),
          ),
        ),
        buildStep(
          title: 'Success',
          isActive: currentStep >= 3,
        ),
      ],
    );
  }

  Widget buildStep({required String title, required bool isActive}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: isActive ? AppColor.primary : AppColor.toneFive,
          child: isActive
              ? const Icon(
                  FontAwesomeIcons.check,
                  color: AppColor.background,
                )
              : null,
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? AppColor.secondary : AppColor.toneThree,
          ),
        ),
      ],
    );
  }
}
