import 'package:door_care/feature/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:door_care/feature/drawer/page/user_details.dart';
import 'package:door_care/core/theme/color/app_color.dart';
import 'package:door_care/core/util/png_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

import '../../core/widget/toastifiaction_widget.dart';
import '../auth/view/page/sign_in_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.primary,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) => UserDetailsPage()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 70, left: 10),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(AppPngPath.homeCleanOne),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Safwan Pulisseri',
                        style:
                            Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  color: AppColor.background,
                                  fontSize: 17,
                                ),
                      ),
                      Text(
                        'safwanpulisseri123@gmail.com',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColor.background,
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                const DrawerItem(
                    icon: Icons.calendar_today, text: 'My Bookings'),
                const DrawerItem(icon: Icons.payment, text: 'Payments Methods'),
                const DrawerItem(icon: Icons.help_outline, text: 'How to use'),
                const DrawerItem(
                    icon: Icons.notifications, text: 'Notification'),
                const DrawerItem(
                    icon: Icons.privacy_tip, text: 'Privacy Policy'),
                const DrawerItem(icon: Icons.info, text: 'About us'),
                const DrawerItem(icon: Icons.support, text: 'Support'),
                const DrawerItem(icon: Icons.share, text: 'Share App'),
                DrawerItem(
                  icon: Icons.logout,
                  text: 'Sign Out',
                  onTap: () {
                    context.read<AuthBloc>().add(SignOutEvent());
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const SignInPage()),
                      (Route<dynamic> route) => false,
                    );
                    ToastificationWidget.show(
                      context: context,
                      type: ToastificationType.success,
                      title: 'Success',
                      description: 'You have been signed out successfully.',
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColor.toneThree.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20),
            ),
            height: 40,
            width: 250,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.info_outline, color: AppColor.background),
                SizedBox(
                  width: 10,
                ),
                Text('Pulisseri Production',
                    style: TextStyle(color: AppColor.background)),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            thickness: 0.5,
            indent: 30,
            endIndent: 30,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('version number',
                style: TextStyle(color: AppColor.toneThree)),
          ),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;

  const DrawerItem({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(text, style: const TextStyle(color: Colors.white)),
      onTap: onTap,
    );
  }
}
