import 'package:flutter/material.dart';

import '../../widgets/appDrawer/custom_drawer.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/common/custom_container.dart';
import '../../widgets/responsive/responsive.dart';

// Model class for payment method
class PaymentMethod {
  final String id;
  final String name;
  final IconData icon;
  bool isEnabled;

  PaymentMethod({
    required this.id,
    required this.name,
    required this.icon,
    this.isEnabled = false,
  });
}

class PaymentTypes extends StatefulWidget {
  const PaymentTypes({super.key});

  @override
  State<PaymentTypes> createState() => _PaymentTypesState();
}

class _PaymentTypesState extends State<PaymentTypes> {
  // Payment methods list declared at top
  final List<PaymentMethod> paymentMethods = [
    PaymentMethod(
      id: 'cash',
      name: 'Cash',
      icon: Icons.attach_money_rounded,
      isEnabled: true,
    ),
    PaymentMethod(
      id: 'card',
      name: 'Card',
      icon: Icons.credit_card_rounded,
      isEnabled: true,
    ),
    PaymentMethod(
      id: 'wallet',
      name: 'Wallet',
      icon: Icons.account_balance_wallet_rounded,
      isEnabled: true,
    ),
    PaymentMethod(
      id: 'paypal',
      name: 'Paypal',
      icon: Icons.paypal,
      isEnabled: true,
    ),
    PaymentMethod(
      id: 'qr',
      name: 'QR Reader',
      icon: Icons.qr_code_scanner_rounded,
      isEnabled: true,
    ),
    PaymentMethod(
      id: 'card_reader',
      name: 'Card Reader',
      icon: Icons.credit_card_rounded,
      isEnabled: true,
    ),
    PaymentMethod(
      id: 'bank',
      name: 'Bank',
      icon: Icons.account_balance_rounded,
      isEnabled: true,
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
                      _buildPaymentTypesHeaderBar(isMobile),
                      _buildPaymentTypesContent(width, isMobile),
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

  Widget _buildPaymentTypesHeaderBar(bool isMobile) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Row(
            children: [
              const Text(
                'Payment Types',
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

  Widget _buildPaymentTypesContent(double width, bool isMobile) {
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
                color:  Colors.grey.shade200,
                width: 1,
              ),

            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isMobile ? 1 : 3,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: isMobile ? 4 : 3.5,
                    ),
                    itemCount: paymentMethods.length,
                    itemBuilder: (context, index) {
                      final method = paymentMethods[index];
                      return _buildPaymentMethodCard(method);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
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

  Widget _buildPaymentMethodCard(PaymentMethod method) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFFF8F9FA),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              method.icon,
              size: 18,
              color: const Color(0xFF6B7280),
            ),
          ),
          const SizedBox(width: 12),
          // Payment Method Name
          Expanded(
            child: Text(
              method.name,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Color(0xFF111827),
              ),
            ),
          ),
          // Toggle Switch
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  method.isEnabled = !method.isEnabled;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 32,
                height: 18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: method.isEnabled
                      ? const Color(0xFF14B51D)
                      : const Color(0xFFF8F8F8),
                  border: method.isEnabled
                      ? null
                      : Border.all(
                    color: Colors.grey.shade200,
                    width: 1,
                  ),
                ),
                child: AnimatedAlign(
                  duration: const Duration(milliseconds: 200),
                  alignment: method.isEnabled
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    width: 14,
                    height: 14,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: method.isEnabled
                          ? Colors.white
                          : Colors.grey[200],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}