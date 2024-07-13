import 'dart:developer';
import 'package:door_care/feature/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:door_care/feature/auth/view/util/auth_util.dart';
import 'package:door_care/feature/auth/view/widget/loading_dialog.dart';
import 'package:door_care/core/widget/appbar_widget.dart';
import 'package:door_care/core/widget/padding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/color/app_color.dart';
import '../../../navigation_menu/page/home_navigation_menu.dart';
import '../widget/auth_button.dart';
import '../widget/auth_text_formfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  //final TextEditingController _confirmPasswordController =
  //    TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    //  _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          log("loading...");
          LoadingDialog.show(context);
        }
        if (state is AuthSuccessState) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const HomeNavigationMenu()),
            (route) => false,
          );
        }
        if (state is AuthFailState) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: const AppBarSingle(),
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: PaddingWidget(
              child: ListView(
                children: [
                  Text(
                    'Sign Up',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColor.secondary,
                          fontSize: 35,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  AuthTextFormField(
                    controller: _nameController,
                    labelText: 'Name',
                    hintText: 'Enter your name',
                    validator: AuthUtil.validateName,
                  ),
                  AuthTextFormField(
                    controller: _mobileController,
                    textInputType: TextInputType.number,
                    labelText: 'Mobile Number',
                    hintText: 'Enter your mobile number',
                    validator: AuthUtil.validateMobileNumber,
                  ),
                  AuthTextFormField(
                    controller: _emailController,
                    textInputType: TextInputType.emailAddress,
                    labelText: 'E-mail',
                    hintText: 'Enter your email',
                    validator: AuthUtil.validateEmail,
                  ),
                  AuthTextFormField(
                    controller: _passwordController,
                    textInputType: TextInputType.visiblePassword,
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    obscureText: true,
                    validator: AuthUtil.validatePassword,
                    showPasswordToggle: true,
                  ),
                  // AuthTextFormField(
                  //   controller: _confirmPasswordController,
                  //   labelText: 'Confirm Password',
                  //   hintText: 'Re-Enter your password',
                  //   obscureText: true,
                  //   validator: (value) => validateConfirmPassword(
                  //       value, _passwordController.text),
                  //   showPasswordToggle: true,
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthButton(
                    buttonText: "Sign Up",
                    navigationTitle: 'Already have an Account? ',
                    navigationSubtitle: 'Sign in',
                    buttonCallback: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                              AccountCreateAuthEvent(
                                name: _nameController.text,
                                mobile: _mobileController.text,
                                email: _emailController.text,
                                password: _passwordController.text,
                              ),
                            );
                      }
                    },
                    textCallback: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
