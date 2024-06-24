import 'package:door_care/view/feature/auth/page/sign_up_page.dart';
import 'package:door_care/view/feature/auth/page/verification_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import '../../../theme/color/app_color.dart';
import '../../../util/svg_asset.dart';
import '../../onboarding/widget/cutom_elevated_button.dart';
import '../widget/customTextFormField.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Spacer(flex: 5),
              Center(child: SvgPicture.asset(AppSvgPath.mainLogo)),
              Spacer(flex: 1),
              Text(
                'Sign in',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 35,
                    ),
                textAlign: TextAlign.center,
              ),
              Spacer(flex: 2),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomTextFormField(
                  controller: emailController,
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
              ),
              Spacer(flex: 1),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomTextFormField(
                  controller: passwordController,
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  obscureText: true, // Hide the password with ****
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
              ),
              const Spacer(flex: 5),
              Padding(
                padding: const EdgeInsets.all(20),
                child: CustomElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const OtpVerificationPage(),
                        ),
                      );
                    }
                  },
                  text: 'Sign In',
                  backgroundColor: AppColor.primary,
                  textColor: AppColor.background,
                  fontSize: 18,
                  width: double.infinity,
                  height: 50,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => SignUpPage()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Create a New Account? ',
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                color: AppColor.secondary,
                                fontSize: 18,
                              ),
                    ),
                    Text(
                      'Sign up',
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                color: AppColor.primary,
                                fontSize: 18,
                              ),
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 20),
            ],
          ),
        ),
      ),
    );
  }
}
