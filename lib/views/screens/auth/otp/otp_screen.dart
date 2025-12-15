import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_hrms_flutter/core/constants/app_assets.dart';
import 'package:new_hrms_flutter/core/constants/app_export.dart';
import 'package:new_hrms_flutter/views/screens/auth/otp/otp_vm.dart';
import 'package:provider/provider.dart';

import '../../../widgets/common/custom_button2.dart';
import '../widgets/auth_right_panel.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  final emailKey = GlobalKey<State<StatefulWidget>>();
  final TextEditingController box1 = TextEditingController();
  final TextEditingController box2 = TextEditingController();
  final TextEditingController box3 = TextEditingController();
  final TextEditingController box4 = TextEditingController();

  final FocusNode fn1 = FocusNode();
  final FocusNode fn2 = FocusNode();
  final FocusNode fn3 = FocusNode();
  final FocusNode fn4 = FocusNode();


  late OtpVm vm;

  @override
  void initState() {
    vm = context.read<OtpVm>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mh = MediaQuery
        .of(context)
        .size
        .height;


    return Consumer<OtpVm>(
    builder: (context, vm, child){
      return CustomDrawer(
        child: Center(
          child: Row(
            children: [
              // ================= LEFT OTP PANEL =================
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 120),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Enter OTP',
                        style: Theme.of(context).textTheme.labelLarge
                            ?.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Enter OTP Sent to the Registered Email ID',
                        style: Theme.of(context).textTheme.labelSmall
                            ?.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withAlpha(
                            (0.7 * 255).toInt(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          otpBox(
                            context: context,
                            controller: box1,
                            focusNode: fn1,
                            index: 0,
                            allControllers: [box1, box2, box3, box4],
                            allFocusNodes: [fn1, fn2, fn3, fn4],
                          ),
                          otpBox(
                            context: context,
                            controller: box2,
                            focusNode: fn2,
                            index: 1,
                            allControllers: [box1, box2, box3, box4],
                            allFocusNodes: [fn1, fn2, fn3, fn4],
                          ),
                          otpBox(
                            context: context,
                            controller: box3,
                            focusNode: fn3,
                            index: 2,
                            allControllers: [box1, box2, box3, box4],
                            allFocusNodes: [fn1, fn2, fn3, fn4],
                          ),
                          otpBox(
                            context: context,
                            controller: box4,
                            focusNode: fn4,
                            index: 3,
                            allControllers: [box1, box2, box3, box4],
                            allFocusNodes: [fn1, fn2, fn3, fn4],
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                   Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 24,
                            width: 53,
                            decoration: const BoxDecoration(color: Color(0xFFFFF0ED)),
                            child:  Center(
                              child: Text(
                                '02:00',
                                style: Theme.of(context).textTheme.labelSmall
                                    ?.copyWith(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.red.withAlpha(
                                    (0.7 * 255).toInt(),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          TextButton(onPressed: (){

                          }, child: Text(
                            'Resend OTP',
                            style: Theme.of(context).textTheme.labelLarge
                                ?.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),)
                        ],
                      ),

                      const SizedBox(height: 20),

                      CustomButton2(
                        key: emailKey,
                        onPressed: () {
                          // if (_formKey.currentState?.validate() != true) {
                          //
                          CustomButton2.shake(emailKey);
                          vm.getPopAndPush(RouteNames.dashboard);

                          //   return;
                          // }

                          // String email = value.emailController.text.trim();
                          // var map = {'email': email};
                        },

                        btnName: 'Verify',
                        isDisable: false,
                        isAnimate: true,
                        isBold: true,
                        buttonHeight: 40,
                        buttonWidth: double.infinity,
                        size: ButtonSize.medium,
                        textSize: 14,
                        textColor: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        buttonColor: AppColors.primaryColor,
                        borderColor: Colors.black.withAlpha(
                          (0.2 * 255).toInt(),
                        ),
                        hideBackground: false,
                        icon: SvgPicture.asset(
                          AppAssets.googleIcon,
                          width: 20,
                          height: 20,
                        ),
                        iconNeed: false,
                        showBorder: false,
                      ),

                      const SizedBox(height: 30),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Back to  ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.black.withAlpha(
                                (0.7 * 255).toInt(),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              vm.getPopAndPush(RouteNames.login);
                            },
                            child:  Text(
                              "Sign in",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: AppColors.primaryColor
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),

              // ================= RIGHT BLUE PANEL =================
              const Expanded(
                flex: 1,
                child: AuthRightPanel(),
              ),
            ],
          ),
        ),
      );
    }
    );
  }

  // ================= OTP BOX =================
  Widget otpBox({
    required BuildContext context,
    required TextEditingController controller,
    required FocusNode focusNode,
    required List<TextEditingController> allControllers,
    required List<FocusNode> allFocusNodes,
    required int index,
  }) {
    return SizedBox(
      height: 90,
      width: 95,
      child: RawKeyboardListener(
        focusNode: FocusNode(),
        onKey: (event) {
          if (event is RawKeyDownEvent &&
              event.logicalKey == LogicalKeyboardKey.backspace &&
              controller.text.isEmpty &&
              index > 0) {
            allFocusNodes[index - 1].requestFocus();
          }
        },
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.4), width: 1),
            ),
          ),
          onChanged: (value) {
            final cleaned = value.replaceAll(RegExp(r'[^0-9]'), '');

            if (cleaned.length > 1) {
              for (int i = 0;
              i < cleaned.length && i < allControllers.length;
              i++) {
                allControllers[i].text = cleaned[i];
              }
              allFocusNodes[
              cleaned.length < allFocusNodes.length
                  ? cleaned.length
                  : allFocusNodes.length - 1]
                  .requestFocus();
              return;
            }

            if (cleaned.isNotEmpty) {
              controller.text = cleaned;
              if (index < allFocusNodes.length - 1) {
                allFocusNodes[index + 1].requestFocus();
              } else {
                focusNode.unfocus();
              }
            } else {
              controller.clear();
            }
          },
        ),
      ),
    );
  }
}




