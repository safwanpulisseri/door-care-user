import 'package:door_care/core/widget/padding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/theme/color/app_color.dart';
import '../../../core/util/png_asset.dart';
import '../../../core/widget/opacity_container.dart';
import '../../auth/bloc/auth_bloc/auth_bloc.dart';
import '../../auth/view/util/auth_util.dart';
import '../../auth/view/widget/auth_text_formfield.dart';
import '../widget/appbar_widget.dart';

class UserDetailsPage extends StatelessWidget {
  UserDetailsPage({super.key});
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarSingle(),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccessState) {
            final user = state.userModel;
            // Initialize controllers with user data
            _nameController.text = user.name;
            _mobileNumberController.text = user.mobile;
            return PaddingWidget(
              child: Column(
                children: [
                  Row(
                    children: [
                      const OpacityContainer(),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Profile',
                        style:
                            Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  color: AppColor.secondary,
                                  fontSize: 30,
                                ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      // ElevatedButton.icon(
                      //   onPressed: () {},
                      //   label: const Text('SAVE'),
                      //   icon: const FaIcon(FontAwesomeIcons.pen,
                      //       color: AppColor.primary),
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: AppColor.background,
                      //     foregroundColor: AppColor.primary,
                      //     padding:
                      //         const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      //   ),
                      // ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColor.toneEleven,
                    backgroundImage: user.profileImg.isNotEmpty
                        ? NetworkImage(
                            user.profileImg,
                          )
                        : const AssetImage(
                            AppPngPath.personImage,
                          ),
                  ),
                  AuthTextFormField(
                    controller: _nameController,
                    labelText: 'Name',
                    hintText: 'Update your name',
                    //validator: AuthUtil.validateName,
                    prefixIcon: IconlyLight.profile,
                  ),
                  const SizedBox(height: 10),
                  AuthTextFormField(
                    controller: _mobileNumberController,
                    labelText: 'Mobile Number',
                    hintText: 'Update your number',
                    //  validator: AuthUtil.validateMobileNumber,
                    prefixIcon: IconlyLight.call,
                    textInputType: TextInputType.phone,
                  ),
                ],
              ),
            );
          } else {
            return Text(
              'Failed Fetch User\'s DEtails',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: AppColor.background,
                    fontSize: 17,
                  ),
            );
          }
        },
      ),
    );
  }
}
