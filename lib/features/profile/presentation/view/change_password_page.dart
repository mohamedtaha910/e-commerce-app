import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/features/auth/presentation/view/widgets/custom_auth_text_feild.dart';
import 'package:e_commerce_app/features/splash/presentation/view/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  String email = FirebaseAuth.instance.currentUser!.email!,
      oldPassword = '',
      newPassword = '',
      confirmPassword = '';
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            surfaceTintColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      shape: BoxShape.circle,
                      // borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black12, width: 0.4),
                    ),
                    child: Icon(
                      Icons.chevron_left_rounded,
                      size: 28,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  'Change Password ',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          body: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Old Password',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    AuthTextFeild(
                      borderRadius: 35,
                      obscureText: true,
                      hintText: 'Enter old password',
                      icon: Icons.lock,
                      onChanged: (value) {
                        oldPassword = value;
                      },
                      paddign: 0,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'New Password',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    AuthTextFeild(
                      borderRadius: 35,
                      obscureText: true,
                      hintText: 'Enter new password',
                      icon: Icons.lock,
                      onChanged: (value) {
                        newPassword = value;
                      },
                      paddign: 0,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Confirm Password',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    AuthTextFeild(
                      borderRadius: 35,
                      obscureText: true,
                      hintText: 'Enter Confirm password',
                      icon: Icons.lock,
                      onChanged: (value) {
                        confirmPassword = value;
                      },
                      paddign: 0,
                    ),
                    const SizedBox(height: 42),
                    // Spacer(),
                    CustomButton(
                      title: 'Change Password',
                      verticalPadding: 8,
                      color: Colors.blueGrey,
                      textColor: Colors.white,
                      horizontalMargin: 0,
                      titleSize: 15,
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          setState(() {
                            isLoading = true;
                          });
                          if (newPassword.length < 6) {
                            isLoading = false;
                            setState(() {});
                            showMessage(
                              context,
                              message: 'Password must be at least 6 characters',
                              icon: Icons.error,
                              color: Colors.red,
                            );
                          } else if (newPassword != confirmPassword) {
                            isLoading = false;
                            setState(() {});
                            showMessage(
                              context,
                              message: 'Passwords do not match',
                              icon: Icons.error,
                              color: Colors.red,
                            );
                          } else {
                            // // ================== windows =====================================
                            // await Future.delayed(
                            //   Duration(seconds: 2),
                            //   () {},
                            // );

                            // isLoading = false;
                            // setState(() {});
                            // showMessage(
                            //   context,
                            //   message: 'Password change successfully',
                            //   icon: Icons.check,
                            //   color: Colors.green,
                            // );
                            // =================== emulator =====================================

                            // print('Password changed successfullyy');

                            bool result = await updatePassword(
                              email: email,
                              oldPassword: oldPassword,
                              newPassword: newPassword,
                            );
                            isLoading = false;
                            setState(() {});

                            if (result) {
                              showMessage(
                                context,
                                message: 'Password changed successfully',
                                icon: Icons.check,
                                color: Colors.green,
                              );
                            } else {
                              showMessage(
                                context,
                                message: 'Something went wrong',
                                icon: Icons.error,
                                color: Colors.red,
                              );
                            }
                            // =====================================================================
                          }
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showMessage(
    BuildContext context, {
    required String message,
    required IconData icon,
    required Color color,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(color == Colors.green ? 16 : 16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,

                color: color == Colors.green
                    ? Colors.green.withAlpha(50)
                    : Colors.red.withAlpha(50),
              ),
              child: Icon(icon, color: color, size: 40),
            ),
            SizedBox(height: 16),
            Text(
              message,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            CustomButton(
              textColor: color,
              titleSize: 16,
              // isBorder: true,
              color: color.withAlpha(70),
              onTap: () {
                Navigator.of(context).pop();
                color == Colors.green ? Navigator.of(context).pop() : null;
              },
              title: 'Ok',
              horizontalMargin: 48,
              verticalPadding: 8,
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> updatePassword({
    required String email,
    required String oldPassword,
    required String newPassword,
  }) async {
    User user = FirebaseAuth.instance.currentUser!;

    try {
      AuthCredential credential = EmailAuthProvider.credential(
        email: email,
        password: oldPassword,
      );

      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(newPassword);

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        showMessage(
          context,
          message: 'Incorrect old password',
          icon: Icons.error,
          color: Colors.red,
        );
        return false;
      }
      return false;
    } catch (e) {
      showMessage(
        context,
        message: 'Error: $e',
        icon: Icons.error,
        color: Colors.red,
      );
      return false;
    }
  }
}
