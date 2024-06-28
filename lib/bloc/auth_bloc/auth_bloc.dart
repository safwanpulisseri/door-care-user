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
        log("helljksdalkfhaskudhfkuo");

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
      (event, emit) {
        log("hai");
        log("${event.name} name");
        log("${event.mobile} mobile");
        emit(AuthLoadingState());
      },
    );
  }
}
