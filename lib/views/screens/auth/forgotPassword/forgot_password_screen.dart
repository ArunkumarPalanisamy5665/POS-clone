import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:new_hrms_flutter/core/constants/app_export.dart';
import 'package:new_hrms_flutter/views/screens/auth/register/register_vm.dart';
import 'package:provider/provider.dart';

import '../../../widgets/common/custom_button.dart';
import '../../../widgets/common/custom_button2.dart';
import '../../../widgets/common/custom_textfield.dart';
import 'forgot_password_vm.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool hidePassword = true;
  bool hideConfirmPassword = true;

  final emailKey = GlobalKey<State<StatefulWidget>>();
  final googleKey = GlobalKey<State<StatefulWidget>>();
  final facebookKey = GlobalKey<State<StatefulWidget>>();



  late ForgotPasswordVm vm;

  @override
  void initState() {
    vm = context.read<ForgotPasswordVm>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final mw = MediaQuery.of(context).size.width;
    final mh = MediaQuery.of(context).size.height;

    return Consumer<ForgotPasswordVm>(
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
                                "Forgot Password",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),

                              ),

                              const SizedBox(height: 8),

                              Text(
                                "Please enter your email address to receive a verification code",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black.withAlpha(
                                    (0.7 * 255).toInt(),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 32),

                              FormBuilder(
                                key: _formKey,
                                child: Column(
                                  children: [


                                    // ---------------- Email ----------------
                                    CustomTextField(
                                      height: 50,
                                      controller: value.emailController,
                                      label: "Email",
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
                                      focusNode: value.emailNode,
                                      nextFocusNode: value.passwordNode,
                                      fillColor: Colors.white,
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
                                  // CustomButton2.shake(emailKey);
                                  vm.getPopAndPush(RouteNames.emailVerify);
                                  //   return;
                                  // }

                                  // String email = value.emailController.text.trim();
                                  // var map = {'email': email};
                                },

                                btnName: 'Send Email',
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

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Back to ",
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

                              const SizedBox(height: 25),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  // RIGHT SIDE BLUE PANEL
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF0C76E1),
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage(AppAssets.loginDashBoardBG),
                          fit: BoxFit.fill
                          ,
                        ),

                      ),
                      margin: const EdgeInsets.all(20),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            top:  mh * 0.060,
                            left: mh * 0.050,
                            right: mh * 0.050,
                            child: Column(
                              children: [
                                Text(
                                  "Complete Control of Your Cafe & ",
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                    fontSize: 28,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  "Restaurant with Ease",
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                    fontSize: 28,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 16),
                                Text(
                                  "From billing to inventory access everything you need\nin a single powerful dashboard.",
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                    fontSize: 12,
                                    color: Colors.white54,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Positioned(
                            bottom: 0,
                            child:  Image.asset(AppAssets.loginDashBoard, height: mh * 0.5, fit: BoxFit.contain,),
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}
