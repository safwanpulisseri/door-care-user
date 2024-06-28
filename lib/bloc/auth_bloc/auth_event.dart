part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class EmailSignInAuthEvent extends AuthEvent {
  final String email;
  final String password;

  const EmailSignInAuthEvent({
    required this.email,
    required this.password,
  });
}

final class AccountCreateAuthEvent extends AuthEvent {
  final String name;
  final String mobile;
  final String email;
  final String password;
  //final String confirmPassword;

  const AccountCreateAuthEvent({
    required this.name,
    required this.mobile,
    //required this.confirmPassword,
    required this.email,
    required this.password,
  });
}
