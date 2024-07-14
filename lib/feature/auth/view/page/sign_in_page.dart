import 'package:door_care/feature/auth/view/page/sign_up_page.dart';
import 'package:door_care/feature/auth/view/util/auth_util.dart';
import 'package:door_care/feature/auth/view/widget/social_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth_bloc/auth_bloc.dart';
import '../../../../core/util/svg_asset.dart';
import '../../../../core/widget/app_logo_widget.dart';
import '../../../navigation_menu/page/home_navigation_menu.dart';
import '../widget/auth_button.dart';
import '../widget/auth_title_widget.dart';
import '../widget/auth_text_formfield.dart';
import '../widget/loading_dialog.dart';
import '../widget/terms_and_conditions_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
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
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: size.height - size.height * 0.07,
                    maxHeight: size.height - size.height * 0.07,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      const AppLogoWidget(),
                      const SizedBox(height: 10),
                      const AuthTitleWidget(
                        title: 'Sign in',
                      ),
                      const SizedBox(height: 30),
                      AuthTextFormField(
                        controller: _emailController,
                        labelText: 'E-mail',
                        hintText: 'Enter your email',
                        validator: AuthUtil.validateEmail,
                        prefixIcon: AppSvgPath.mailLogo,
                      ),
                      const SizedBox(height: 20),
                      AuthTextFormField(
                        controller: _passwordController,
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        obscureText: true,
                        validator: AuthUtil.validatePassword,
                        prefixIcon: AppSvgPath.passwordLogo,
                        showPasswordToggle: true,
                      ),
                      const SizedBox(height: 30),
                      AuthButton(
                        buttonText: "Sign In",
                        navigationTitle: 'Create a New Account? ',
                        navigationSubtitle: 'Sign up',
                        buttonCallback: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          context.read<AuthBloc>().add(
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
                      const Spacer(flex: 1),
                      const SocialAuthWidget(),
                      const Spacer(flex: 1),
                      const Spacer(),
                      const TermsAndConditionsWidget(),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
