import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/features/auth/presentation/view/sign_up_page.dart';
import 'package:e_commerce_app/features/auth/presentation/view/widgets/custom_auth_text_feild.dart';
import 'package:e_commerce_app/features/auth/presentation/view/widgets/custom_header.dart';
import 'package:e_commerce_app/features/auth/presentation/view/widgets/custom_shift.dart';
import 'package:e_commerce_app/features/auth/presentation/view/widgets/other_way.dart';
import 'package:e_commerce_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/view/home_page.dart';
import 'package:e_commerce_app/features/splash/presentation/view/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email;
  String? password;
  bool isLoading = false;
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          isLoading = true;
        } else if (state is LoginSuccessState) {
          isLoading = false;
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => const HomePage()));
        } else if (state is LoginErrorState) {
          isLoading = false;
          showErrorMessage(context, message: state.error);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: SafeArea(
            bottom: false,
            top: false,
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Scaffold(
                backgroundColor: AppColors.backgroundColor,
                // appBar: AppBar(),
                body: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Form(
                    key: formKey,
                    autovalidateMode: autovalidateMode,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomHeader(
                          icon: CupertinoIcons.person_crop_circle_fill,

                          showBack: true,
                        ),
                        // ,
                        Transform.translate(
                          offset: Offset(0, -200),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 24,
                            ),
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // SizedBox(height: 32),
                                Text(
                                  'Log in',
                                  style: const TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                    letterSpacing: -0.5,
                                    height: 1.1,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Log in to your account',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey.withOpacity(0.65),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 38),
                                Text(
                                  'Email address',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade800,
                                  ),
                                ),
                                SizedBox(height: 8),
                                AuthTextFeild(
                                  height: 12,

                                  hintText: 'Email',
                                  icon: Icons.email,
                                  onChanged: (value) {
                                    email = value;
                                  },
                                  borderRadius: 22,
                                  obscureText: false,
                                  paddign: 0,
                                ),
                                SizedBox(height: 16),
                                Text(
                                  'Password',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade800,
                                  ),
                                ),
                                SizedBox(height: 8),
                                AuthTextFeild(
                                  height: 12,
                                  hintText: 'Password',
                                  paddign: 0,
                                  icon: Icons.lock,
                                  onChanged: (value) {
                                    password = value;
                                  },
                                  borderRadius: 22,
                                  obscureText: true,
                                ),
                                SizedBox(height: 32),
                                CustomButton(
                                  // color: const Color.fromARGB(255, 248, 124, 41),
                                  // color: const Color.fromARGB(255, 251, 157, 95),
                                  color: AppColors.primaryColor,
                                  borderRadius: 14,
                                  textColor: Colors.white,
                                  title: 'Log In',
                                  titleSize: 17,
                                  verticalPadding: 10,
                                  horizontalMargin: 0,
                                  onTap: () {
                                    autovalidateMode = AutovalidateMode.always;
                                    setState(() {});

                                    if (formKey.currentState!.validate()) {
                                      BlocProvider.of<AuthCubit>(
                                        context,
                                      ).loginUser(
                                        email: email!,
                                        password: password!,
                                      );
                                    }
                                  },
                                ),
                                SizedBox(height: 32),
                                OtherWay(),
                                SizedBox(height: 32),
                                CustomShift(
                                  destination: SignUpPage(),
                                  text: 'Register Now',
                                  text2: 'Don\'t have an account?  ',
                                ),
                                SizedBox(height: 8),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void showErrorMessage(BuildContext context, {required String message}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.withAlpha(50),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.error, color: Colors.pink, size: 40),
            ),
            SizedBox(height: 24),
            Text(
              message,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 32),
            CustomButton(
              title: 'Ok',
              titleSize: 15,
              onTap: () {
                Navigator.pop(context);
              },
              verticalPadding: 8,
              color: Colors.red.withAlpha(50),
              // isBorder: true,
              textColor: Colors.pink,
              horizontalMargin: 50,
            ),
          ],
        ),
      ),
    );
  }
}
