import 'package:door_care/view/theme/color/app_color.dart';
import 'package:door_care/view/util/png_asset.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.primary,
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Safwan Pulisseri'),
            accountEmail: Text('safwanpulisseri123@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(AppPngPath.onboardOne),
            ),
            decoration: BoxDecoration(color: AppColor.primary),
          ),
          Expanded(
            child: ListView(
              children: const [
                DrawerItem(icon: Icons.calendar_today, text: 'My Bookings'),
                DrawerItem(icon: Icons.payment, text: 'Payments Methods'),
                DrawerItem(icon: Icons.help_outline, text: 'How to use'),
                DrawerItem(icon: Icons.notifications, text: 'Notification'),
                DrawerItem(icon: Icons.privacy_tip, text: 'Privacy Policy'),
                DrawerItem(icon: Icons.info, text: 'About us'),
                DrawerItem(icon: Icons.support, text: 'Support'),
                DrawerItem(icon: Icons.share, text: 'Share App'),
                DrawerItem(icon: Icons.logout, text: 'Sign Out'),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline, color: Colors.white),
            title: const Text('Pulisseri Production',
                style: TextStyle(color: Colors.white)),
            tileColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('version number', style: TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const DrawerItem({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(text, style: const TextStyle(color: Colors.white)),
      onTap: () {},
    );
  }
}
