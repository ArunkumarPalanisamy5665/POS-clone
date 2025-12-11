import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileManager extends StatelessWidget {
  const ProfileManager({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PopupMenuButton<int>(
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, size: 60),
            SizedBox(height: 8),
            Text("Profile Menu"),
          ],
        ),
        onSelected: (value) {
          switch (value) {
            case 0:
              context.go('/profile/info');
              break;
            case 1:
              context.go('/profile/documents');
              break;
            case 2:
              context.go('/profile/settings');
              break;
          }
        },
        itemBuilder: (_) => [
          const PopupMenuItem(
            value: 0,
            child: Text("Profile Info"),
          ),
          const PopupMenuItem(
            value: 1,
            child: Text("Documents"),
          ),
          const PopupMenuItem(
            value: 2,
            child: Text("Profile Settings"),
          ),
        ],
      ),
    );
  }
}
