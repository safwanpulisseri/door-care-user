import 'package:door_care/feature/booking/page/booking.dart';
import 'package:door_care/feature/home/page/home.dart';
import 'package:door_care/core/theme/color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc/navigation_bloc.dart';

class HomeNavigationMenu extends StatelessWidget {
  HomeNavigationMenu({super.key});

  final List<Widget> _pages = [
    const HomePage(),
    const BookingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigationBloc, NavigationState>(
      listener: (context, state) {
        // if (state is NavigationPageState) {
        //   if (state.pageIndex == 0) {
        //     context
        //         .read<FetchAllAddedServicesBloc>()
        //         .add(FetchAllServicesEvent());
        //   } else if (state.pageIndex == 1) {
        //     //
        //   }
        // }
      },
      builder: (context, state) {
        int selectedIndex = state is NavigationPageState ? state.pageIndex : 0;
        return Scaffold(
          body: _pages[selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            selectedItemColor: AppColor.primary,
            onTap: (index) {
              BlocProvider.of<NavigationBloc>(context)
                  .add(PageChangedEvent(index));
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_rounded),
                label: '',
              ),
            ],
          ),
        );
      },
    );
  }
}
