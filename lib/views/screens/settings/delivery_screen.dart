import 'package:flutter/material.dart';

import '../../widgets/appDrawer/custom_drawer.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/common/custom_container.dart';
import '../../widgets/responsive/responsive.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({super.key});

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  bool isFreeDeliveryEnabled = true;
  bool isFixedDeliveryEnabled = true;
  bool isKmBasedDeliveryEnabled = true;

  final TextEditingController freeDeliveryController = TextEditingController();
  final TextEditingController fixedDeliveryController = TextEditingController();
  final TextEditingController perKmChargeController = TextEditingController();
  final TextEditingController minDeliveryController = TextEditingController();
  final TextEditingController minDistanceController = TextEditingController();

  @override
  void dispose() {
    freeDeliveryController.dispose();
    fixedDeliveryController.dispose();
    perKmChargeController.dispose();
    minDeliveryController.dispose();
    minDistanceController.dispose();
    super.dispose();
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
                      _buildDeliveryHeaderBar(isMobile),
                      _buildDeliveryContent(width, isMobile),
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

  Widget _buildDeliveryHeaderBar(bool isMobile) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Row(
            children: [
              const Text(
                'Delivery',
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

  Widget _buildDeliveryContent(double width, bool isMobile) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade200, width: 1),
            ),
            child: Column(
              children: [
                _buildSection(
                  title: 'Free Delivery',
                  isEnabled: isFreeDeliveryEnabled,
                  onToggle: () {
                    setState(() {
                      isFreeDeliveryEnabled = !isFreeDeliveryEnabled;
                    });
                  },
                  children: [
                    _buildInputField(
                      label: 'Free Delivery Over (\$)',
                      controller: freeDeliveryController,
                      isRequired: true,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                _buildSection(
                  title: 'Fixed Delivery Charges',
                  isEnabled: isFixedDeliveryEnabled,
                  onToggle: () {
                    setState(() {
                      isFixedDeliveryEnabled = !isFixedDeliveryEnabled;
                    });
                  },
                  children: [
                    _buildInputField(
                      label: 'Fixed Delivery Amount (\$)',
                      controller: fixedDeliveryController,
                      isRequired: true,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                _buildSection(
                  title: 'Kilometer Based Delivery Charges',
                  isEnabled: isKmBasedDeliveryEnabled,
                  onToggle: () {
                    setState(() {
                      isKmBasedDeliveryEnabled = !isKmBasedDeliveryEnabled;
                    });
                  },
                  children: [
                    _buildInputField(
                      label: 'Per KM Delivery Charge (\$)',
                      controller: perKmChargeController,
                      isRequired: true,
                    ),
                    const SizedBox(height: 16),
                    _buildInputField(
                      label: 'Minimum Delivery Over (\$)',
                      controller: minDeliveryController,
                      isRequired: true,
                    ),
                    const SizedBox(height: 16),
                    _buildInputField(
                      label: 'Minimum Distance for Free Delivery (KM)',
                      controller: minDistanceController,
                      isRequired: true,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),

        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0,top: 0,bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(
                onTap: () {},
                text: 'Cancel',
                textStyle: const TextStyle(
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
                textStyle: const TextStyle(
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

  Widget _buildSection({
    required String title,
    required bool isEnabled,
    required VoidCallback onToggle,
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              _buildToggle(isEnabled: isEnabled, onToggle: onToggle),
            ],
          ),
          const SizedBox(height: 24),
          ...children,
        ],
      ),
    );
  }

  Widget _buildToggle({
    required bool isEnabled,
    required VoidCallback onToggle,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onToggle,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 32,
          height: 18,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: isEnabled
                ? const Color(0xFF14B51D)
                : const Color(0xFFF8F8F8),
            border: isEnabled
                ? null
                : Border.all(color: Colors.grey.shade200, width: 1),
          ),
          child: AnimatedAlign(
            duration: const Duration(milliseconds: 200),
            alignment: isEnabled ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              width: 14,
              height: 14,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isEnabled ? Colors.white : Colors.grey[200],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    bool isRequired = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            children: [
              if (isRequired)
                const TextSpan(
                  text: ' *',
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFFAFAFA),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFF14B51D), width: 1),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
      ],
    );
  }
}
