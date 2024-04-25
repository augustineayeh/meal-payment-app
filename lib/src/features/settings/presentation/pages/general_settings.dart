// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:meal_payment_app/src/features/settings/presentation/pages/profile_settings.dart';
import 'package:meal_payment_app/src/features/settings/presentation/pages/security_settings.dart';

class GeneralSettingsPage extends StatelessWidget {
  const GeneralSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'General settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            _SettingsTile(
              leading: Icons.person,
              title: 'Profile',
              page: ProfileSettings(),
            ),
            _SettingsTile(
              leading: Icons.person,
              title: 'Security',
              page: SecuritySettings(),
            )
          ],
        ),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    super.key,
    required this.leading,
    required this.title,
    required this.page,
  });
  final IconData leading;
  final String title;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        leading,
        size: 38,
      ),
      title: Text(
        title,
        style: const TextStyle(
          // fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => page,
            ));
      },
      trailing: const Icon(
        Icons.navigate_next,
        size: 38,
      ),
    );
  }
}
