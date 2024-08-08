import 'package:door_care/app_view.dart';
import 'package:door_care/feature/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:door_care/feature/auth/data/service/local/auth_local_service.dart';
import 'package:door_care/feature/auth/data/service/remote/auth_remote_service.dart';
import 'package:door_care/feature/auth/data/repository/auth_repo.dart';
import 'package:door_care/feature/navigation_menu/bloc/bloc/navigation_bloc.dart';
import 'package:door_care/feature/service/bloc/bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/home/data/repository/fetch_all_services_repo.dart';
import 'feature/home/data/service/remote/fetch_all_services_remote_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepo(
            AuthRemoteService(),
            AuthLocalService(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AuthBloc(context.read<AuthRepo>())..add(CheckUserEvent()),
          ),
          // BlocProvider(
          //   create: (context) =>
          //       FetchAllAddedServicesBloc(context.read<FetchAllServiceRepo>()),
          // ),
          BlocProvider(
            create: (context) => NavigationBloc(),
          ),
          BlocProvider(
            create: (context) => StepperNavigationBloc(),
          )
        ],
        child: const MyAppView(),
      ),
    );
  }
}
