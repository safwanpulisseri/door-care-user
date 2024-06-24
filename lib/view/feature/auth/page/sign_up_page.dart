import 'package:door_care/view/feature/auth/page/verification_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../theme/color/app_color.dart';
import '../../../util/svg_asset.dart';
import '../../onboarding/widget/cutom_elevated_button.dart';
import '../widget/customTextFormField.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController secondNameController = TextEditingController();
    final TextEditingController mobileController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColor.background,
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
                child: CustomTextFormField(
                  controller: firstNameController,
                  labelText: 'First Name',
                  hintText: 'Enter your first name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
                child: CustomTextFormField(
                  controller: secondNameController,
                  labelText: 'Last Name',
                  hintText: 'Enter your last name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
                child: CustomTextFormField(
                  controller: mobileController,
                  labelText: 'Mobile Number',
                  hintText: 'Enter your mobile number',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your mobile number';
                    } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                      return 'Please enter a valid 10-digit mobile number';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
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
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
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
                  showPasswordToggle: true,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
                child: CustomTextFormField(
                  controller: confirmPasswordController,
                  labelText: 'Confirm Password',
                  hintText: 'Re-Enter your password',
                  obscureText: true, // Hide the password with ****
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    } else if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  showPasswordToggle: true,
                ),
              ),
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
                  text: 'Sign Up',
                  backgroundColor: AppColor.primary,
                  textColor: AppColor.background,
                  fontSize: 18,
                  width: double.infinity,
                  height: 50,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => const OtpVerificationPage(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an Account? ',
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                color: AppColor.secondary,
                                fontSize: 18,
                              ),
                    ),
                    Text(
                      'Sign in',
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                color: AppColor.primary,
                                fontSize: 18,
                              ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
