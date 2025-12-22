import 'package:flutter/material.dart';

import '../../widgets/appDrawer/custom_drawer.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/common/custom_container.dart';
import '../../widgets/responsive/responsive.dart';

class StoreSettings extends StatefulWidget {
  const StoreSettings({super.key});

  @override
  State<StoreSettings> createState() => _StoreSettingsState();
}

class _StoreSettingsState extends State<StoreSettings> {
  String? selectedCountry;
  String? selectedState;
  String? selectedCurrency;

  bool enableQRMenu = true;
  bool enableTakeAway = true;
  bool enableDineIn = true;
  bool enableReservation = false;
  bool enableOrderViaQR = true;
  bool enableDelivery = true;
  bool enableTable = true;

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
                      _buildStoreSettingsHeaderBar(isMobile),
                      _buildStoreSettingsContent(width, isMobile),
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

  Widget _buildStoreSettingsHeaderBar(bool isMobile) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text(
                'Store Settings',
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

  Widget _buildStoreSettingsContent(double width, bool isMobile) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.grey.shade200,
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Upload Section
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8F8F8),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey[200]!),
                      ),
                      child: const Icon(
                        Icons.add_photo_alternate_outlined,
                        size: 48,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Upload Store Image',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF111827),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Image should be with in 5 MB',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.edit_outlined),
                                iconSize: 20,
                                padding: const EdgeInsets.all(8),
                                constraints: const BoxConstraints(),
                                style: IconButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  side: BorderSide(color: Colors.grey[300]!),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.delete_outline),
                                iconSize: 20,
                                color: const Color(0xFFEF4444),
                                padding: const EdgeInsets.all(8),
                                constraints: const BoxConstraints(),
                                style: IconButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  side: BorderSide(color: Colors.grey[300]!),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // Store Name
                _buildLabel('Store Name', isRequired: true),
                const SizedBox(height: 8),
                _buildTextField(),
                const SizedBox(height: 24),

                // Address 1 and Address 2
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLabel('Address 1', isRequired: true),
                          const SizedBox(height: 8),
                          _buildTextField(),
                        ],
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLabel('Address 2'),
                          const SizedBox(height: 8),
                          _buildTextField(),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Country, State, City, Pincode
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLabel('Country', isRequired: true),
                          const SizedBox(height: 8),
                          _buildDropdown(
                            value: selectedCountry,
                            hint: 'Select',
                            onChanged: (value) {
                              setState(() => selectedCountry = value);
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLabel('State', isRequired: true),
                          const SizedBox(height: 8),
                          _buildDropdown(
                            value: selectedState,
                            hint: 'Select',
                            onChanged: (value) {
                              setState(() => selectedState = value);
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLabel('City', isRequired: true),
                          const SizedBox(height: 8),
                          _buildTextField(),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLabel('Pincode', isRequired: true),
                          const SizedBox(height: 8),
                          _buildTextField(),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Email, Phone, Currency
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLabel('Email', isRequired: true),
                          const SizedBox(height: 8),
                          _buildTextField(),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLabel('Phone', isRequired: true),
                          const SizedBox(height: 8),
                          _buildTextField(),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLabel('Currency', isRequired: true),
                          const SizedBox(height: 8),
                          _buildDropdown(
                            value: selectedCurrency,
                            hint: 'Select',
                            onChanged: (value) {
                              setState(() => selectedCurrency = value);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // Toggle Switches - Two Columns
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          _buildToggleRow(
                            'Enable QR Menu',
                            enableQRMenu,
                                (value) => setState(() => enableQRMenu = value),
                          ),
                          const SizedBox(height: 16),
                          _buildToggleRow(
                            'Enable Take Away',
                            enableTakeAway,
                                (value) => setState(() => enableTakeAway = value),
                          ),
                          const SizedBox(height: 16),
                          _buildToggleRow(
                            'Enable Dine In',
                            enableDineIn,
                                (value) => setState(() => enableDineIn = value),
                          ),
                          const SizedBox(height: 16),
                          _buildToggleRow(
                            'Enable Reservation',
                            enableReservation,
                                (value) => setState(() => enableReservation = value),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 48),
                    Expanded(
                      child: Column(
                        children: [
                          _buildToggleRow(
                            'Enable Order Via QR Menu',
                            enableOrderViaQR,
                                (value) => setState(() => enableOrderViaQR = value),
                          ),
                          const SizedBox(height: 16),
                          _buildToggleRow(
                            'Enable Delivery',
                            enableDelivery,
                                (value) => setState(() => enableDelivery = value),
                          ),
                          const SizedBox(height: 16),
                          _buildToggleRow(
                            'Enable Table',
                            enableTable,
                                (value) => setState(() => enableTable = value),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        const SizedBox(
          height: 10,
        ),

        Padding(
          padding: const EdgeInsets.only(right: 20.0, top: 0, bottom: 10),
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

  Widget _buildLabel(String text, {bool isRequired = false}) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF374151),
          ),
        ),
        if (isRequired)
          const Text(
            ' *',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFFEF4444),
            ),
          ),
      ],
    );
  }

  Widget _buildTextField() {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF3B82F6)),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  Widget _buildDropdown({
    required String? value,
    required String hint,
    required Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF3B82F6)),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      hint: Text(
        hint,
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 14,
        ),
      ),
      items: const [],
      onChanged: onChanged,
      icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey[600]),
    );
  }

  Widget _buildToggleRow(String label, bool value, Function(bool) onChanged) {
    return Row(
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => onChanged(!value),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 32,
              height: 18,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: value
                    ? const Color(0xFF14B51D)
                    : const Color(0xFFF8F8F8),
                border: value
                    ? null
                    : Border.all(
                  color: Colors.grey.shade200,
                  width: 1,
                ),
              ),
              child: AnimatedAlign(
                duration: const Duration(milliseconds: 200),
                alignment:
                value ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: 14,
                  height: 14,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: value ? Colors.white : Colors.grey[200],
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF374151),
          ),
        ),
      ],
    );
  }
}