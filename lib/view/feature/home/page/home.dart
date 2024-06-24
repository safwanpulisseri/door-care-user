import 'package:door_care/view/feature/auth/widget/customTextFormField.dart';
import 'package:door_care/view/feature/drawer/home_drawer.dart';
import 'package:door_care/view/feature/onboarding/widget/cutom_elevated_button.dart';
import 'package:door_care/view/theme/color/app_color.dart';
import 'package:door_care/view/util/app_padding.dart';
import 'package:door_care/view/widget/padding_widget.dart';
import 'package:flutter/material.dart';
import '../../../widget/opacity_container.dart';
import '../widget/join_our_team.dart';
import '../widget/review_card.dart';
import '../widget/service_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: const Text(
          'HELLO SAFWAN 👋',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        backgroundColor: AppColor.background,
      ),
      drawer: const CustomDrawer(),
      body: PaddingWidget(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'What you are looking for today',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: AppColor.secondary,
                        fontSize: 35,
                      ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 16),
                const SearchBar(),
                const SizedBox(height: 24),
                Row(
                  children: [
                    const OpacityContainer(),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Cleaning Services',
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                color: AppColor.secondary,
                              ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      ServiceCard(
                        image: 'assets/png/home_clean_one.png',
                        title: 'Home Cleaning',
                      ),
                      ServiceCard(
                        image: 'assets/png/home_clean_two.png',
                        title: 'Carpet Cleaning',
                      ),
                      ServiceCard(
                        image: 'assets/png/home_clean_one.png',
                        title: 'Home Cleaning',
                      ),
                      ServiceCard(
                        image: 'assets/png/home_clean_two.png',
                        title: 'Carpet Cleaning',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      ReviewCard(),
                      ReviewCard(),
                      ReviewCard(),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const OpacityContainer(),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Join Our Team',
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                color: AppColor.secondary,
                              ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const JoinOurTeamCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.toneThree.withOpacity(0.3)),
        color: AppColor.textfield,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColor.toneThree.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search what you need...',
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(Icons.search, color: AppColor.background),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
