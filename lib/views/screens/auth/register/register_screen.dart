import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:new_hrms_flutter/core/constants/app_export.dart';
import 'package:new_hrms_flutter/views/screens/auth/register/register_vm.dart';
import 'package:provider/provider.dart';

import '../../../widgets/common/custom_button.dart';
import '../../../widgets/common/custom_button2.dart';
import '../../../widgets/common/custom_textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool hidePassword = true;
  bool hideConfirmPassword = true;

  final emailKey = GlobalKey<State<StatefulWidget>>();
  final googleKey = GlobalKey<State<StatefulWidget>>();
  final facebookKey = GlobalKey<State<StatefulWidget>>();



  late RegisterVm vm;

  @override
  void initState() {
    vm = context.read<RegisterVm>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final mw = MediaQuery.of(context).size.width;
    final mh = MediaQuery.of(context).size.height;

    return Consumer<RegisterVm>(
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
                                "Sign Up",
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
                                "And let’s get started with your free trial",
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
                                    // ---------------- User Name ----------------
                                    CustomTextField(
                                      height: 50,
                                      controller: value.emailController,
                                      label: "User Name",
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
                                      focusNode: value.userNameNode,
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

                                    const SizedBox(height: 15),

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

                                    const SizedBox(height: 15),

                                    // ---------------- Password ----------------
                                    CustomTextField(
                                      height: 50,
                                      controller: value.passwordController,
                                      label: "Password",
                                      fillColor: Colors.white,
                                      obscure: hidePassword,
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
                                        () => hideConfirmPassword = !hideConfirmPassword,
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

                              const SizedBox(height: 10),

                              Row(
                                children: [
                                  Checkbox(
                                    value: true,
                                    onChanged: (v) {},
                                    activeColor: AppColors.primaryColor,
                                  ),

                                  Text(
                                    "Remember Me",
                                    style: Theme.of(context).textTheme.bodySmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey.shade700,
                                          fontSize: 13,
                                        ),
                                  ),

                                  const Spacer(),

                                  TextButton(
                                    onPressed: () {
                                      vm.getPopAndPush(RouteNames.forgotPassword);
                                    },
                                    child: Text(
                                      "Forgot Password?",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color: AppColors.primaryColor,
                                            fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                          ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 25),

                              CustomButton2(
                                key: emailKey,
                                onPressed: () {
                                  // if (_formKey.currentState?.validate() != true) {
                                  //
                                  CustomButton2.shake(emailKey);
                                  //   return;
                                  // }

                                  // String email = value.emailController.text.trim();
                                  // var map = {'email': email};
                                },

                                btnName: 'Sign Up',
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

                              // Divider
                              Row(
                                children: [
                                  Expanded(
                                    child: Divider(
                                      color: Colors.black.withAlpha(
                                        (0.2 * 255).toInt(),
                                      ),
                                      height: 0.03,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
                                    child: Text(
                                      "or continue with",
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
                                  ),
                                  Expanded(
                                    child: Divider(
                                      color: Colors.black.withAlpha(
                                        (0.2 * 255).toInt(),
                                      ),
                                      height: 0.03,
                                    ),
                                  ),
                                ],
                              ),

                             SizedBox(height: 25,),

                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                               children: [
                               Expanded(
                                 child: CustomButton2(
                                   key: googleKey,
                                   onPressed: () {
                                     // if (_formKey.currentState?.validate() != true) {
                                     //
                                     CustomButton2.shake(googleKey);
                                     //   return;
                                     // }

                                     // String email = value.emailController.text.trim();
                                     // var map = {'email': email};
                                   },

                                   btnName: 'Google',
                                   isDisable: false,
                                   isAnimate: true,
                                   isBold: true,
                                   buttonHeight: mh * 0.044,
                                   // buttonWidth: mw * 0.213,
                                   size: ButtonSize.medium,
                                   textSize: 14,
                                   textColor: Colors.black,
                                   borderRadius: BorderRadius.circular(5),
                                   buttonColor: Theme.of(context).colorScheme.surface,
                                   borderColor: Colors.black.withAlpha(
                                     (0.2 * 255).toInt(),
                                   ),
                                   hideBackground: false,
                                   icon: SvgPicture.asset(
                                     AppAssets.googleIcon,
                                     width: 20,
                                     height: 20,
                                   ),
                                   iconNeed: true,
                                   showBorder: true,
                                 ),
                               ),
                               SizedBox(width: 20,),
                               Expanded(
                                 child: CustomButton2(
                                   key: facebookKey,
                                   onPressed: () {
                                     // if (_formKey.currentState?.validate() != true) {
                                     //
                                     CustomButton2.shake(facebookKey);
                                     //   return;
                                     // }

                                     // String email = value.emailController.text.trim();
                                     // var map = {'email': email};
                                   },

                                   btnName: 'Facebook',
                                   isDisable: false,
                                   isAnimate: true,
                                   isBold: true,
                                   buttonHeight: mh * 0.044,
                                   // buttonWidth: mw * 0.213,
                                   borderRadius: BorderRadius.circular(5),
                                   size: ButtonSize.medium,
                                   textSize: 14,
                                   textColor: Colors.black,
                                   buttonColor: Theme.of(context).colorScheme.surface,
                                   borderColor: Colors.black.withAlpha(
                                     (0.2 * 255).toInt(),
                                   ),
                                   hideBackground: false,
                                   icon: SvgPicture.asset(
                                     AppAssets.facebookIcon,
                                     width: 20,
                                     height: 20,
                                   ),
                                   iconNeed: true,
                                   showBorder: true,
                                 ),
                               ),
                             ],),


                              const SizedBox(height: 25),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Already have an account? ",
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
