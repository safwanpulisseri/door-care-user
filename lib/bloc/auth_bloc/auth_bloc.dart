import 'dart:developer';
import 'package:door_care/data/model/user_model.dart';
import 'package:door_care/data/repository/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo _authRepo;
  AuthBloc(this._authRepo) : super(AuthInitialState()) {
    on<EmailSignInAuthEvent>(
      (event, emit) async {
        log("Email Auth");

        emit(AuthLoadingState());
        try {
          final UserModel userModel = await _authRepo.emailSignIn(
            email: event.email,
            password: event.password,
          );
          log("user mode -> $userModel");
          emit(AuthSuccessState(userModel: userModel));
        } catch (e) {
          emit(AuthFailState());
        }
      },
    );
    on<AccountCreateAuthEvent>(
      (event, emit) async {
        log("User Registartion");
        log("${event.name} name");
        log("${event.mobile} mobile");
        log("${event.email} mail");

        emit(AuthLoadingState());
        try {
          final UserModel userModel = await _authRepo.userRegistration(
            name: event.name,
            mobile: event.mobile,
            email: event.email,
            password: event.password,
            // confirmPassword: event.confirmPassword,
          );
          log("user model -> $userModel");
          emit(AuthSuccessState(userModel: userModel));
        } catch (e) {
          emit(AuthFailState());
        }
      },
    );
  }
}
