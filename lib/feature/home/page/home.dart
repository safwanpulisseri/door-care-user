import 'package:door_care/feature/drawer/home_drawer.dart';
import 'package:door_care/feature/home/widget/search_widget.dart';
import 'package:door_care/core/theme/color/app_color.dart';
import 'package:door_care/core/widget/padding_widget.dart';
import 'package:flutter/material.dart';
import '../../../core/widget/opacity_container.dart';
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
                const SearchWidget(),
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
