import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/features/auth/presentation/view/sign_up_page.dart';
import 'package:e_commerce_app/features/auth/presentation/view/widgets/custom_auth_text_feild.dart';
import 'package:e_commerce_app/features/auth/presentation/view/widgets/custom_header.dart';
import 'package:e_commerce_app/features/auth/presentation/view/widgets/custom_shift.dart';
import 'package:e_commerce_app/features/auth/presentation/view/widgets/other_way.dart';
import 'package:e_commerce_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/view/home_page.dart';
import 'package:e_commerce_app/features/splash/presentation/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          child: Scaffold(
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
                      image: 'assets/auth_images/sign_up.svg',
                      text: 'assets/auth_images/Log_in_word.svg',
                    ),
                    // SizedBox(height: 12),
                    AuthTextFeild(
                      hintText: 'Email',
                      icon: Icons.email,
                      onChanged: (value) {
                        email = value;
                      },
                      borderRadius: 25,
                      obscureText: false,
                    ),
                    SizedBox(height: 24),
                    AuthTextFeild(
                      hintText: 'Password',
                      icon: Icons.lock,
                      onChanged: (value) {
                        password = value;
                      },
                      borderRadius: 25,
                      obscureText: true,
                    ),
                    SizedBox(height: 32),
                    CustomButton(
                      color: AppColors.primaryColor,
                      textColor: Colors.white,
                      title: 'Log In',
                      titleSize: 17,
                      verticalPadding: 10,
                      horizontalMargin: 16,
                      onTap: () {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});

                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(
                            context,
                          ).loginUser(email: email!, password: password!);
                        }
                      },
                    ),
                    SizedBox(height: 16),
                    OtherWay(),
                    SizedBox(height: 16),
                    CustomShift(
                      destination: SignUpPage(),
                      text: 'Register Now',
                      text2: 'Don\'t have an account?  ',
                    ),
                    SizedBox(height: 20),
                  ],
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
              child: Icon(Icons.error, color: Colors.red, size: 40),
            ),
            SizedBox(height: 24),
            Text(
              message,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 32),
            CustomButton(
              title: 'Ok',
              titleSize: 17,
              onTap: () {
                Navigator.pop(context);
              },
              verticalPadding: 8,
              color: AppColors.primaryColor,
              textColor: Colors.white,
              horizontalMargin: 16,
            ),
          ],
        ),
      ),
    );
  }
}
