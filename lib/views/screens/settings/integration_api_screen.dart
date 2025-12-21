import 'package:flutter/material.dart';
import 'package:new_hrms_flutter/views/screens/settings/widgets/integration_api_list.dart';

import '../../widgets/appDrawer/custom_drawer.dart';
import '../../widgets/common/custom_container.dart';
import '../../widgets/responsive/responsive.dart';


class IntegrationApiScreen extends StatefulWidget {
  const IntegrationApiScreen({super.key});

  @override
  State<IntegrationApiScreen> createState() => _IntegrationApiScreenState();
}

class _IntegrationApiScreenState extends State<IntegrationApiScreen> {


  List<IntegrationItem> integrations = [
    IntegrationItem(
      name: 'Gmail',
      description: 'RESTful API you can use to send, receive, search, label, archive emails, manage settings in Gmail mailboxes.',
      iconPath: 'assets/images/gmail.png',
      isEnabled: true,
    ),
    IntegrationItem(
      name: 'Gupshup',
      description: 'Messaging platform (SMS, WhatsApp, RCS) with presence',
      iconPath: 'assets/images/gupshup.png',
      isEnabled: false,
    ),
    IntegrationItem(
      name: 'PrintNode',
      description: 'Middleware agents for cloud-to-local printing.',
      iconPath: 'assets/images/print_node.png',
      isEnabled: false,
    ),
  ];

  void _toggleIntegration(int index) {
    setState(() {
      integrations[index] = IntegrationItem(
        name: integrations[index].name,
        description: integrations[index].description,
        iconPath: integrations[index].iconPath,
        iconBackgroundColor: integrations[index].iconBackgroundColor,
        isEnabled: !integrations[index].isEnabled,
      );
    });
  }


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
                      _buildIntegrationApiHeaderBar(isMobile),
                      _buildIntegrationApiContent(width),
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

  Widget _buildIntegrationApiHeaderBar(bool isMobile) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Row(
            children: [
              const Text(
                'Integrations / API',
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

  Widget _buildIntegrationApiContent(double width) {

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
              border: Border.all(
                color: Colors.grey.shade200,
                width: 1,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.separated(
                itemCount: integrations.length,
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  return IntegrationItemWidget(
                    integration: integrations[index],
                    onToggle: () => _toggleIntegration(index),
                  );
                },
                shrinkWrap: true,
              ),
            ),
          ),
        ),

      ],
    );
  }
}
