import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:new_hrms_flutter/core/constants/app_assets.dart';
import 'package:new_hrms_flutter/views/widgets/common/validators.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/network/base/base_vm.dart';
import '../../../../core/routes/route_names.dart';
import '../../../widgets/common/common_widgets.dart';
import '../../../widgets/common/custom_button.dart';
import '../../../widgets/common/custom_textfield.dart';
import 'login_vm.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool hidePassword = true;

  late LoginVm vm;

  @override
  void initState() {
    vm = context.read<LoginVm>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<LoginVm>(
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor, // coral background
          body: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Image.asset(
                  AppAssets.logoBG,
                  fit: BoxFit.cover,
                ),),

              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    AppAssets.centerBG,
                    fit: BoxFit.cover,
                    width: 400,
                    height: 250,
                  ),
                ),
              ),


              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.63,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 30),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(45),
                    ),
                  ),

                  // Content
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        // ---------------- Sign In Header ----------------
                        const Text(
                          "Sign in",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          height: 3,
                          width: 60,
                          color: AppColors.primaryColor,
                        ),

                        const SizedBox(height: 28),

                        // ---------------- FORM ----------------
                        FormBuilder(
                          key: _formKey,
                          child: Column(
                            children: [

                              // ---------------- Email ----------------
                              CustomTextField(
                                controller: value.emailController,
                                label: "Email",
                                // YOU ADD THIS IN YOUR CUSTOM FIELD
                                hint: "demo@email.com",

                                prefixIcon: Icons.email_outlined,
                                iconColor: Colors.grey.shade600,

                                focusNode: value.emailNode,
                                nextFocusNode: value.passwordNode,
                              ),

                              const SizedBox(height: 20),

                              // ---------------- Password ----------------
                              CustomTextField(
                                controller: value.passwordController,
                                label: "Password",
                                obscure: hidePassword,
                                hint: "Enter your password",

                                prefixIcon: Icons.lock_outline,
                                suffixIcon:
                                hidePassword ? Icons.visibility_off : Icons.visibility,
                                onSuffixTap: () =>
                                    setState(() => hidePassword = !hidePassword),

                                focusNode: value.passwordNode,
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
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade700,
                              ),
                            ),

                            const Spacer(),

                            TextButton(
                              onPressed: () {},
                              child:  Text(
                                "Forgot Password?",
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 25),

                        CustomButton(
                          text: "Login",
                          backgroundColor: AppColors.primaryColor,
                          textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),

                          height: 48,
                          isLoading: value.state == ViewState.loading,
                          onTap: () {
                            vm.getPopAndPush(RouteNames.home);
                          },
                        ),

                        const SizedBox(height: 25),

                        // ---------------- SIGN UP LINK ----------------
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don’t have an Account? ",
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                              ),),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                " Sign up",
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        );
      },
    );
  }
}



