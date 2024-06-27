import 'dart:developer';

import 'package:door_care/view/feature/auth/page/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/auth_bloc/auth_bloc.dart';
import '../../../util/svg_asset.dart';
import '../../../widget/app_logo_widget.dart';
import '../widget/auth_button.dart';
import '../widget/auth_title_widget.dart';
import '../widget/auth_text_formfield.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthBloc _authBloc = AuthBloc();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _authBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      bloc: _authBloc,
      listener: (context, state) {
        if (state is AuthLoading) {
          log("loading...");
          // LoadingDialog.show(context);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  const AppLogoWidget(),
                  const SizedBox(height: 10),
                  const AuthTitleWidget(
                    title: 'Sign in',
                  ),
                  const Spacer(flex: 1),
                  AuthTextFormField(
                    controller: _emailController,
                    labelText: 'E-mail',
                    hintText: 'Enter your email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                          .hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    prefixIcon: AppSvgPath.mailLogo,
                  ),
                  const Spacer(flex: 1),
                  AuthTextFormField(
                    controller: _passwordController,
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    obscureText: true, // Hide the password
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                    prefixIcon: AppSvgPath.passwordLogo,
                    showPasswordToggle: true,
                  ),
                  const Spacer(flex: 2),
                  AuthButton(
                    buttonText: "Sign In",
                    navigationTitle: 'Create a New Account? ',
                    navigationSubtitle: 'Sign up',
                    buttonCallback: () {
                      _authBloc.add(
                        EmailSignInAuthEvent(
                          email: _emailController.text,
                          password: _passwordController.text,
                        ),
                      );
                    },
                    textCallback: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SignUpPage(),
                        ),
                      );
                    },
                  ),
                  const Spacer(flex: 7),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
