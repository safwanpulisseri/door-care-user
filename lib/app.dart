import 'package:door_care/app_view.dart';
import 'package:door_care/feature/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:door_care/feature/auth/data/service/auth_service.dart';
import 'package:door_care/feature/auth/data/repository/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthRepo(AuthService())),
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
