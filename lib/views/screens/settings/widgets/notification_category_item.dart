import 'package:flutter/material.dart';
import 'notification_toggle_switch.dart';

class NotificationCategoryItem extends StatelessWidget {
  final String name;
  final bool pushEnabled;
  final bool smsEnabled;
  final bool emailEnabled;
  final VoidCallback onPushToggle;
  final VoidCallback onSmsToggle;
  final VoidCallback onEmailToggle;

  const NotificationCategoryItem({
    super.key,
    required this.name,
    required this.pushEnabled,
    required this.smsEnabled,
    required this.emailEnabled,
    required this.onPushToggle,
    required this.onSmsToggle,
    required this.onEmailToggle,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: isMobile ? Wrap(spacing: 24,
                runSpacing: 12,
                children: [
                  _buildChannelToggle('Push', pushEnabled, onPushToggle),
                  const SizedBox(width: 40),
                  _buildChannelToggle('SMS', smsEnabled, onSmsToggle),
                  const SizedBox(width: 40),
                  _buildChannelToggle('Email', emailEnabled, onEmailToggle),

],
            )

          : Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildChannelToggle(
            'Push', pushEnabled, onPushToggle),
        const SizedBox(width: 40),
        _buildChannelToggle(
            'SMS', smsEnabled, onSmsToggle),
        const SizedBox(width: 40),
        _buildChannelToggle(
            'Email', emailEnabled, onEmailToggle),
      ],
    ),
          ),
        ],
      ),
    );
  }

  Widget _buildChannelToggle(String label, bool value, VoidCallback onTap) {
    return Row(
      children: [
        NotificationToggleSwitch(
          isEnabled: value,
          onToggle: onTap,
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
