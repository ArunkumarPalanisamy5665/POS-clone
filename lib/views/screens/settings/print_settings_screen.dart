import 'package:flutter/material.dart';

import '../../widgets/appDrawer/custom_drawer.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/common/custom_container.dart';
import '../../widgets/responsive/responsive.dart';

class PrintSettingsScreen extends StatefulWidget {
  const PrintSettingsScreen({super.key});

  @override
  State<PrintSettingsScreen> createState() => _PrintSettingsScreenState();
}

class _PrintSettingsScreenState extends State<PrintSettingsScreen> {
  bool enablePrint = true;
  bool showStoreDetails = true;
  bool showCustomerDetails = true;
  bool showNotes = true;
  bool printTokens = true;
  String? selectedFormat;
  final TextEditingController headerController = TextEditingController();
  final TextEditingController footerController = TextEditingController();

  @override
  void dispose() {
    headerController.dispose();
    footerController.dispose();
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
                      _buildPrintSettingsHeaderBar(isMobile),
                      _buildPrintSettingsContent(width, isMobile),
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

  Widget _buildPrintSettingsHeaderBar(bool isMobile) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Row(
            children: [
              const Text(
                'Print Settings',
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

  Widget _buildPrintSettingsContent(double width, bool isMobile) {
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

                Text(
                  'Print Settings',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.grey.shade900,
                  ),
                ),
                const SizedBox(height: 20),
                // Enable Print Toggle
                _buildToggleRow('Enable Print', enablePrint, (value) {
                  setState(() => enablePrint = value);
                }),

                const SizedBox(height: 24),

                // Show Store Details Toggle
                _buildToggleRow('Show Store Details', showStoreDetails, (value) {
                  setState(() => showStoreDetails = value);
                }),

                const SizedBox(height: 24),

                // Show Customer Details Toggle
                _buildToggleRow('Show Customer Details', showCustomerDetails, (value) {
                  setState(() => showCustomerDetails = value);
                }),

                const SizedBox(height: 24),

                // Format Dropdown
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        text: 'Format (Page Sizes)',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: ' *',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value:selectedFormat ,
                      decoration: InputDecoration(
                        hintText: 'Select',
                        hintStyle: TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade200,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade200,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade200,
                            ),
                          ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: ['A4', 'A5', 'Letter', 'Legal']
                          .map((format) => DropdownMenuItem(
                        value: format,
                        child: Text(format),
                      ))
                          .toList(),
                      onChanged: (value) {
                        setState(() => selectedFormat = value);
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Header Text Field
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Header',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: headerController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.all(16),
                        fillColor: const Color(0xFFF8F8F8),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade200,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade200,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade200,
                          ),
                        )

                      ),


                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Footer Text Field
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Footer',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: footerController,
                      maxLines: 5,
                      decoration:  InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16),
                        fillColor: Color(0xFFF8F8F8),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade200,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade200,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade200,
                            ),
                          )
                      ),

                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Show Notes Toggle
                _buildToggleRow('Show Notes', showNotes, (value) {
                  setState(() => showNotes = value);
                }),

                const SizedBox(height: 24),

                // Print Tokens Toggle
                _buildToggleRow('Print Tokens', printTokens, (value) {
                  setState(() => printTokens = value);
                }),
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

  Widget _buildToggleRow(String label, bool value, Function(bool) onToggle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => onToggle(!value),
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
                alignment: value
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
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
      ],
    );
  }
}