import 'package:door_care/view/widget/padding_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../theme/color/app_color.dart';
import '../../../util/png_asset.dart';
import '../../../widget/opacity_container.dart';
import '../../auth/widget/customTextFormField.dart';
import '../widget/appbar_widget.dart';

class UserDetailsPage extends StatelessWidget {
  UserDetailsPage({super.key});
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarSingle(),
      body: PaddingWidget(
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
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: AppColor.secondary,
                        fontSize: 30,
                      ),
                ),
                const Spacer(
                  flex: 1,
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  label: const Text('SAVE'),
                  icon: const FaIcon(FontAwesomeIcons.pen,
                      color: AppColor.primary),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.background,
                    foregroundColor: AppColor.primary,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                ),
              ],
            ),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(AppPngPath.homeCleanOne),
            ),
            CustomTextFormField(
              controller: _nameController,
              labelText: 'Name',
              hintText: 'Update your name',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              controller: _mobileNumberController,
              labelText: 'Mobile Number',
              hintText: 'Update your number',
            ),
          ],
        ),
      ),
    );
  }
}
