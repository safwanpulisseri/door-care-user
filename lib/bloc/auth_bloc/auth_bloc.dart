import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<EmailSignInAuthEvent>(
      (event, emit) {
        log("helljksdalkfhaskudhfkuo");
        log("${event.email} email");
        log("${event.password} password");
        emit(AuthLoading());
      },
    );
  }
}
