import 'package:door_care/feature/auth/data/model/user_model.dart';
import 'package:door_care/feature/auth/data/repository/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  /// Create a repository to interact with the authentication service
  final AuthRepo _authRepo;
  AuthBloc(this._authRepo) : super(AuthInitialState()) {
    /// Handle the email sign in event
    on<EmailSignInAuthEvent>(
      (event, emit) async {
        // Emit the loading state
        emit(AuthLoadingState());
        try {
          // Try to authenticate the user
          final UserModel userModel = await _authRepo.emailSignIn(
            email: event.email,
            password: event.password,
          );

          // Emit the success state
          emit(AuthSuccessState(userModel: userModel));
        } catch (e) {
          // Emit the fail state
          emit(AuthFailState());
        }
      },
    );

    /// Handle the account creation event
    on<AccountCreateAuthEvent>(
      (event, emit) async {
        // Emit the loading state
        emit(AuthLoadingState());
        try {
          // Try to create a new user account
          final UserModel userModel = await _authRepo.userRegistration(
            name: event.name,
            mobile: event.mobile,
            email: event.email,
            password: event.password,
          );

          // Emit the success state
          emit(AuthSuccessState(userModel: userModel));
        } catch (e) {
          // Emit the fail state
          emit(AuthFailState());
        }
      },
    );
  }
}
