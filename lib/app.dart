import 'package:door_care/app_view.dart';
import 'package:door_care/bloc/auth_bloc/auth_bloc.dart';
import 'package:door_care/data/data_provider/auth_data.dart';
import 'package:door_care/data/repository/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthRepo(AuthData())),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthBloc(context.read<AuthRepo>())),
        ],
        child: const MyAppView(),
      ),
    );
  }
}
