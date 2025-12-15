import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class otpScreen extends StatefulWidget {
  const otpScreen({super.key});

  @override
  State<otpScreen> createState() => _otpScreenState();
}

class _otpScreenState extends State<otpScreen> {
  static const int otpLength = 4;

  final TextEditingController _otpController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  String otp = '';

  @override
  void dispose() {
    _otpController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => _focusNode.requestFocus(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 448,
            height: 332,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Enter OTP',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Enter OTP Sent to the Registered Email ID',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.withOpacity(0.6),
                  ),
                ),

                const SizedBox(height: 20),

                /// 🔐 HIDDEN INPUT (React InputOtp equivalent)
                SizedBox(
                  height: 0,
                  width: 0,
                  child: TextField(
                    controller: _otpController,
                    focusNode: _focusNode,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(otpLength),
                    ],
                    onChanged: (value) {
                      setState(() {
                        otp = value;
                      });
                    },
                  ),
                ),

                /// OTP UI BOXES
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(otpLength, (index) {
                    return Container(
                      height: 90,
                      width: 95.33,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: index < otp.length
                              ? Colors.blue
                              : Colors.grey.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        index < otp.length ? otp[index] : '',
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }),
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 24,
                      width: 53,
                      decoration:
                      const BoxDecoration(color: Color(0xFFFFF0ED)),
                      child: const Center(
                        child: Text(
                          '02:00',
                          style: TextStyle(
                            color: Color(0xFFFF3636),
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Resend OTP',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: otp.length == otpLength
                        ? () {
                      debugPrint('OTP = $otp');
                    }
                        : null,
                    child: const Text('Verify'),
                  ),
                ),

                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Back to',
                      style: TextStyle(
                        color: Colors.grey.withOpacity(0.6),
                        fontSize: 14,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        ' Sign in',
                        style: TextStyle(fontSize: 14, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
