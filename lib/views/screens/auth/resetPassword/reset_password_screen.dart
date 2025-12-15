import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:new_hrms_flutter/core/constants/app_export.dart';
import 'package:new_hrms_flutter/views/screens/auth/register/register_vm.dart';
import 'package:new_hrms_flutter/views/screens/auth/resetPassword/reset_password_vm.dart';
import 'package:new_hrms_flutter/views/widgets/auth/step_progress_indicator.dart';
import 'package:provider/provider.dart';

import '../../../widgets/common/custom_button.dart';
import '../../../widgets/common/custom_button2.dart';
import '../../../widgets/common/custom_textfield.dart';
import '../../../widgets/auth/auth_right_panel.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool hidePassword = true;
  bool hideConfirmPassword = true;
  int passwordStep = 0;

  final emailKey = GlobalKey<State<StatefulWidget>>();
  final googleKey = GlobalKey<State<StatefulWidget>>();
  final facebookKey = GlobalKey<State<StatefulWidget>>();

  late ResetPasswordVm vm;

  void updatePasswordStrength(String password) {
    int step = 0;

    if (password.length >= 8) step++;
    if (RegExp(r'[A-Za-z]').hasMatch(password)) step++;
    if (RegExp(r'[0-9]').hasMatch(password)) step++;
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) step++;

    setState(() {
      passwordStep = step.clamp(0, 4);
    });
  }

  @override
  void initState() {
    vm = context.read<ResetPasswordVm>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mw = MediaQuery.of(context).size.width;
    final mh = MediaQuery.of(context).size.height;

    return Consumer<ResetPasswordVm>(
      builder: (context, value, child) {
        return CustomDrawer(
          backgroundColor: Colors.white,
          child: Center(
            child: SizedBox(
              // width: 1440,
              child: Row(
                children: [
                  // LEFT SIDE FORM
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 120),
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(
                          context,
                        ).copyWith(scrollbars: false),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 40),

                              SvgPicture.asset(
                                AppAssets.posLogoIcon,
                                // width: 20,
                                height: 48,
                              ),
                              const SizedBox(height: 40),

                              Text(
                                "Reset Password",
                                style: Theme.of(context).textTheme.labelLarge
                                    ?.copyWith(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),

                              const SizedBox(height: 8),

                              Text(
                                "Your new password must be different from previous used passwords.",
                                style: Theme.of(context).textTheme.labelSmall
                                    ?.copyWith(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black.withAlpha(
                                    (0.7 * 255).toInt(),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),

                              FormBuilder(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    // ---------------- Password ----------------
                                    CustomTextField(
                                      height: 50,
                                      controller: value.passwordController,
                                      label: "Password",
                                      fillColor: Colors.white,
                                      obscure: hidePassword,
                                      onChanged: (val) {
                                        updatePasswordStrength(val);
                                      },
                                      borderColor: AppColors.grey.withAlpha(
                                        (0.3 * 255).toInt(),
                                      ),
                                      focusColor: AppColors.grey.withAlpha(
                                        (0.3 * 255).toInt(),
                                      ),
                                      cursorColor: Colors.black.withAlpha(
                                        (0.7 * 255).toInt(),
                                      ),
                                      borderWidth: 0.75,
                                      suffixIcon: hidePassword
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                      onSuffixTap: () => setState(
                                            () => hidePassword = !hidePassword,
                                      ),
                                      iconSize: 14,
                                      focusNode: value.passwordNode,
                                      nextFocusNode: value.confirmPasswordNode,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white10,
                                      ),
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        height: 2.5,
                                      ),

                                    ),

                                    const SizedBox(height: 12),
                                   StepProgressIndicator(
                                      totalSteps: 4,
                                      currentStep: passwordStep,
                                    ),

                                    const SizedBox(height: 12),

                                    Text(
                                      "Use 8 or more characters with a mix of letters, numbers & symbols.",
                                      style: Theme.of(context).textTheme.labelSmall
                                          ?.copyWith(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black.withAlpha(
                                          (0.7 * 255).toInt(),
                                        ),
                                      ),
                                    ),

                                    CustomTextField(
                                      height: 50,
                                      controller:
                                      value.confirmPasswordController,
                                      label: "Confirm Password",
                                      fillColor: Colors.white,
                                      obscure: hideConfirmPassword,
                                      borderColor: AppColors.grey.withAlpha(
                                        (0.3 * 255).toInt(),
                                      ),
                                      focusColor: AppColors.grey.withAlpha(
                                        (0.3 * 255).toInt(),
                                      ),
                                      cursorColor: Colors.black.withAlpha(
                                        (0.7 * 255).toInt(),
                                      ),
                                      borderWidth: 0.75,
                                      iconSize: 14,
                                      suffixIcon: hideConfirmPassword
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                      onSuffixTap: () => setState(
                                            () => hideConfirmPassword =
                                        !hideConfirmPassword,
                                      ),

                                      focusNode: value.confirmPasswordNode,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white10,
                                      ),
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        height: 2.5,
                                      ),
                                    ),
                                  ],
                                ),
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

                                btnName: 'Submit',
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

                              // CustomButton(
                              //   text: "Sign Up",
                              //   borderRadius: 5,
                              //   backgroundColor: AppColors.primaryColor,
                              //   textStyle: Theme.of(context).textTheme.bodySmall
                              //       ?.copyWith(
                              //         color: Colors.white,
                              //         fontWeight: FontWeight.w500,
                              //       ),
                              //
                              //   height: 40,
                              //   isLoading: value.state == ViewState.loading,
                              //   onTap: () {
                              //     vm.getPopAndPush(RouteNames.home);
                              //   },
                              // ),
                              const SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  // RIGHT SIDE BLUE PANEL
                  const Expanded(flex: 1, child: AuthRightPanel()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
