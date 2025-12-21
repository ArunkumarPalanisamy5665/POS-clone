import 'package:flutter/material.dart';
import 'package:new_hrms_flutter/views/screens/settings/widgets/notification_category_item.dart';
import 'package:new_hrms_flutter/views/screens/settings/widgets/notification_toggle_switch.dart';
import 'package:new_hrms_flutter/views/widgets/common/custom_button.dart';
import 'package:new_hrms_flutter/views/widgets/common/custom_button2.dart';
import '../../widgets/appDrawer/custom_drawer.dart';
import '../../widgets/common/custom_container.dart';
import '../../widgets/common/custom_divider.dart';
import '../../widgets/responsive/responsive.dart';

class NotificationCategory {
  final String name;
  bool pushEnabled;
  bool smsEnabled;
  bool emailEnabled;

  NotificationCategory({
    required this.name,
    required this.pushEnabled,
    required this.smsEnabled,
    required this.emailEnabled,
  });
}

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool mobilePushEnabled = true;
  bool desktopEnabled = true;

  List<NotificationCategory> categories = [
    NotificationCategory(
      name: 'Payment',
      pushEnabled: true,
      smsEnabled: true,
      emailEnabled: true,
    ),
    NotificationCategory(
      name: 'Transaction',
      pushEnabled: true,
      smsEnabled: true,
      emailEnabled: false,
    ),
    NotificationCategory(
      name: 'Activity',
      pushEnabled: true,
      smsEnabled: true,
      emailEnabled: true,
    ),
    NotificationCategory(
      name: 'Account',
      pushEnabled: true,
      smsEnabled: true,
      emailEnabled: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isMobile = Responsive.isMobile(context);

        return CustomDrawer(
          backgroundColor: const Color(0xFFF8F8F8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildNotificationSettingsHeaderBar(isMobile),
                      _buildNotificationSettingsContent(width, isMobile),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNotificationSettingsHeaderBar(bool isMobile) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Row(
            children: [
              const Text(
                'Notifications',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              const SizedBox(width: 10),
              CustomContainer(
                onTap: () {},
                isNeedHover: true,
                padding: const EdgeInsets.all(8),
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'assets/images/refresh_icon.png',
                  height: 16,
                  width: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationSettingsContent(double width, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade200, width: 1),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Mobile Push Notifications
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade200, width: 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          _buildToggleRow(
                            'Mobile Push Notifications',
                            mobilePushEnabled,
                            (value) {
                              setState(() {
                                mobilePushEnabled = value;
                              });
                            },
                          ),
                          const SizedBox(height: 4),
                          CustomDivider(
                            color: Colors.grey.shade200,
                            thickness: 1,
                          ),
                          const SizedBox(height: 4),

                          // Desktop Notifications
                          _buildToggleRow(
                            'Desktop Notifications',
                            desktopEnabled,
                            (value) {
                              setState(() {
                                desktopEnabled = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // General Notification Section
                  Text(
                    'General Notification',
                    style: TextStyle(
                      fontSize: 16.1,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey.shade900,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Categories List Container
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: const Color(0xFFE5E7EB),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: categories.length,
                      separatorBuilder: (context, index) =>
                          Divider(height: 1, color: Colors.grey.shade200),
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return NotificationCategoryItem(
                          name: category.name,
                          pushEnabled: category.pushEnabled,
                          smsEnabled: category.smsEnabled,
                          emailEnabled: category.emailEnabled,
                          onPushToggle: () {
                            setState(() {
                              category.pushEnabled = !category.pushEnabled;
                            });
                          },
                          onSmsToggle: () {
                            setState(() {
                              category.smsEnabled = !category.smsEnabled;
                            });
                          },
                          onEmailToggle: () {
                            setState(() {
                              category.emailEnabled = !category.emailEnabled;
                            });
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Action Buttons
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
            right: 20,
            bottom: 20,
            left: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(
                onTap: () {},
                text: 'Cancel',
                textStyle:  const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                width: 78,
                height: 39,
                borderRadius: 6,
                backgroundColor: Colors.white,
                shadowColor: Colors.black12,

              ),
              const SizedBox(width: 12),
              CustomButton(
                onTap: () {},
                text: 'Save Changes',
                textStyle:  const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                width: 126,
                height: 39,
                borderRadius: 6,
                backgroundColor: const Color(0xFF0D76E1),

              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildToggleRow(String title, bool value, Function(bool) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade900,
          ),
        ),
        NotificationToggleSwitch(
          isEnabled: value,
          onToggle: () => onChanged(!value),
        ),
      ],
    );
  }
}
