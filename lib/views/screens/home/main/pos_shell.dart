import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PosShell extends StatelessWidget {
  final Widget child;

  const PosShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          _ProfileSideMenu(),
          Expanded(
            child: Column(
              children: [
                _ProfileHeader(),
                Expanded(child: child),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileSideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Colors.blue.shade50,
      child: Column(
        children: [
          _menu(context, 'Profile Info', '/profile/info'),
          _menu(context, 'Documents', '/profile/documents'),
          _menu(context, 'Settings', '/profile/settings'),
        ],
      ),
    );
  }

  Widget _menu(BuildContext context, String title, String route) {
    return InkWell(
      onTap: (){
        GoRouter.of(context).go(route);
      },
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(title),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.blue,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(16),
      child: const Text(
        'PROFILE AREA',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}


class ProfileInfoPage extends StatelessWidget {
  const ProfileInfoPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Profile Info'));
  }
}

class ProfileDocumentsPage extends StatelessWidget {
  const ProfileDocumentsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Profile Documents'));
  }
}

class ProfileSettingsPage extends StatelessWidget {
  const ProfileSettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Profile Settings'));
  }
}
