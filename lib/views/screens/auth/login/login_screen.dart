import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:new_hrms_flutter/core/constants/app_assets.dart';
import 'package:new_hrms_flutter/views/widgets/appDrawer/custom_drawer.dart';
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
  bool isChecked = false;

  @override
  void initState() {
    vm = context.read<LoginVm>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginVm>(
      builder: (context, value, child) {
        return CustomDrawer(
          backgroundColor: AppColors.white, // coral background
          child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 10,
                bottom: 10,
                width: MediaQuery.of(context).size.width * 0.50,
                // 55% right area
                child: Container(
                  height: 920,
                  width: 684,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppAssets.loginBg),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 50,
                top: 0,
                bottom: 0,
                width: MediaQuery.of(context).size.width * 0.50,
                // 45% left area
                child: buildLoginForm(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildLoginForm() {

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: true),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 448,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 40,
                children: [
                  Container(
                    height: 40,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 105,
                      children: [
                        Container(
                          height: 40,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 54,
                            children: [],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 24,
                      children: [
                        Container(
                          width: double.infinity,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 24,
                            children: [
                              Container(
                                width: double.infinity,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 4,
                                  children: [
                                    Image.asset(
                                      'assets/images/app_logo.png',
                                      width: 134.74,
                                      height: 40,
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      'Hi, Welcome Back !!!',
                                      style: TextStyle(
                                        color: const Color(
                                          0xFF0F172A,
                                        ) /* Grey-Shades-Grey-900 */,
                                        fontSize: 24,
                                        fontFamily: 'Instrument Sans',
                                        fontWeight: FontWeight.w700,
                                        height: 1.20,
                                      ),
                                    ),
                                    Text(
                                      'Please enter your credentials to sign in!',
                                      style: TextStyle(
                                        color: const Color(
                                          0xFF475569,
                                        ) /* Grey-Shades-Grey-600 */,
                                        fontSize: 14,
                                        fontFamily: 'Instrument Sans',
                                        fontWeight: FontWeight.w400,
                                        height: 1.50,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 16,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        spacing: 24,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              spacing: 12,
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    spacing: 8,
                                                    children: [
                                                      SizedBox(
                                                        width: 448,
                                                        child: Text.rich(
                                                          TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text: 'Email ',
                                                                style: TextStyle(
                                                                  color: const Color(
                                                                    0xFF0F172A,
                                                                  ) /* Grey-Shades-Grey-900 */,
                                                                  fontSize: 14,
                                                                  fontFamily:
                                                                      'Instrument Sans',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  height: 1.50,
                                                                ),
                                                              ),
                                                              TextSpan(
                                                                text: '*',
                                                                style: TextStyle(
                                                                  color: const Color(
                                                                    0xFFFF3636,
                                                                  ) /* System-Danger */,
                                                                  fontSize: 14,
                                                                  fontFamily:
                                                                      'Instrument Sans',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  height: 1.50,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      //email
                                                      TextFormField(
                                                        decoration: InputDecoration(
                                                          border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  10,
                                                                ),

                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    spacing: 8,
                                                    children: [
                                                      SizedBox(
                                                        width: 448,
                                                        child: Text.rich(
                                                          TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    'Password ',
                                                                style: TextStyle(
                                                                  color: const Color(
                                                                    0xFF0F172A,
                                                                  ) /* Grey-Shades-Grey-900 */,
                                                                  fontSize: 14,
                                                                  fontFamily:
                                                                      'Instrument Sans',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  height: 1.50,
                                                                ),
                                                              ),
                                                              TextSpan(
                                                                text: '*',
                                                                style: TextStyle(
                                                                  color: const Color(
                                                                    0xFFFF3636,
                                                                  ) /* System-Danger */,
                                                                  fontSize: 14,
                                                                  fontFamily:
                                                                      'Instrument Sans',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  height: 1.50,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      TextFormField(
                                                        decoration: InputDecoration(
                                                          border: OutlineInputBorder(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                              10,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              spacing: 182,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  spacing: 5,
                                                  children: [

                                              Checkbox(
                                              value: isChecked,
                                              onChanged: (value) {
                                                setState(() {
                                                  isChecked = value ?? false;
                                                });
                                              },
                                            ),
                                                    Text(
                                                      'Remember me',
                                                      style: TextStyle(
                                                        color: const Color(
                                                          0xFF475569,
                                                        ) /* Grey-Shades-Grey-600 */,
                                                        fontSize: 14,
                                                        fontFamily:
                                                            'Instrument Sans',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 1.50,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  'Forgot password?',
                                                  style: TextStyle(
                                                    color: const Color(
                                                      0xFF0C76E1,
                                                    ) /* Base-Primary */,
                                                    fontSize: 14,
                                                    fontFamily:
                                                        'Instrument Sans',
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.50,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 24,
                            children: [
                              Container(
                                width: double.infinity,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  spacing: 20,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 8,
                                      ),
                                      decoration: ShapeDecoration(
                                        color: const Color(
                                          0xFF0C76E1,
                                        ) /* Base-Primary */,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        spacing: 8,
                                        children: [
                                          Text(
                                            'Sign In',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color:
                                                  Colors.white /* Base-White */,
                                              fontSize: 14,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w600,
                                              height: 1.50,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  spacing: 16,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        spacing: 16,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                    width: 1,
                                                    strokeAlign: BorderSide
                                                        .strokeAlignCenter,
                                                    color: const Color(
                                                      0xFFE2E8F0,
                                                    ) /* Grey-Shades-Grey-200 */,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'or continue with',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: const Color(
                                                0xFF475569,
                                              ) /* Grey-Shades-Grey-600 */,
                                              fontSize: 16,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                              height: 1.50,
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                    width: 1,
                                                    strokeAlign: BorderSide
                                                        .strokeAlignCenter,
                                                    color: const Color(
                                                      0xFFE2E8F0,
                                                    ) /* Grey-Shades-Grey-200 */,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  spacing: 12,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 8,
                                        ),
                                        decoration: ShapeDecoration(
                                          color: Colors.white /* Base-White */,
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                              width: 1,
                                              strokeAlign:
                                                  BorderSide.strokeAlignOutside,
                                              color: const Color(
                                                0xFFE2E8F0,
                                              ) /* Grey-Shades-Grey-200 */,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              6,
                                            ),
                                          ),
                                          shadows: [
                                            BoxShadow(
                                              color: Color(0x3FDBDBDB),
                                              blurRadius: 4,
                                              offset: Offset(0, 4),
                                              spreadRadius: 0,
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          spacing: 8,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              spacing: 8,
                                              children: [
                                                Container(
                                                  width: 20,
                                                  height: 20,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(),
                                                  child: Stack(),
                                                ),
                                                Text(
                                                  'Google',
                                                  style: TextStyle(
                                                    color: const Color(
                                                      0xFF0F172A,
                                                    ) /* Grey-Shades-Grey-900 */,
                                                    fontSize: 14,
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.50,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 8,
                                        ),
                                        decoration: ShapeDecoration(
                                          color: Colors.white /* Base-White */,
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                              width: 1,
                                              strokeAlign:
                                                  BorderSide.strokeAlignOutside,
                                              color: const Color(
                                                0xFFE2E8F0,
                                              ) /* Grey-Shades-Grey-200 */,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              6,
                                            ),
                                          ),
                                          shadows: [
                                            BoxShadow(
                                              color: Color(0x3FDBDBDB),
                                              blurRadius: 4,
                                              offset: Offset(0, 4),
                                              spreadRadius: 0,
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          spacing: 8,
                                          children: [
                                            Container(
                                              width: 20,
                                              height: 20,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(),
                                              child: Stack(),
                                            ),
                                            Text(
                                              'Facebook',
                                              style: TextStyle(
                                                color: const Color(
                                                  0xFF0F172A,
                                                ) /* Grey-Shades-Grey-900 */,
                                                fontSize: 14,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w500,
                                                height: 1.50,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Don’t have an account?  ',
                                style: TextStyle(
                                  color: const Color(
                                    0xFF475569,
                                  ) /* Grey-Shades-Grey-600 */,
                                  fontSize: 14,
                                  fontFamily: 'Instrument Sans',
                                  fontWeight: FontWeight.w400,
                                  height: 1.50,
                                ),
                              ),
                              TextSpan(
                                text: 'Sign Up',
                                style: TextStyle(
                                  color: const Color(
                                    0xFF0C76E1,
                                  ) /* Base-Primary */,
                                  fontSize: 14,
                                  fontFamily: 'Instrument Sans',
                                  fontWeight: FontWeight.w500,
                                  height: 1.50,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
