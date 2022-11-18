import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ministry_system/responsive/res.dart';
import 'package:ministry_system/widgets/reusable_text.dart';
import 'package:ministry_system/widgets/reusable_textformfield.dart';
import 'package:ministry_system/widgets/submit_button.dart';

class LoginPane extends StatefulWidget {
  const LoginPane({super.key});

  @override
  State<LoginPane> createState() => _LoginPaneState();
}

class _LoginPaneState extends State<LoginPane> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool isShown = true;

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) return 'Email can not be empty';

    String pattern = r'\w+@\w+\.\w+';
    RegExp reg = RegExp(pattern);
    if (!reg.hasMatch(email)) {
      return 'Invalid Email format';
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password can not be empty';
    }

    if (password.length < 8) {
      return 'Password too short';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    Responsive res = Responsive(context: context);
    return Scaffold(
      backgroundColor: const Color(0xFFD9D9D9),
      body: Center(
        child: Container(
          width: res.getWidth(600),
          height: res.getHeight(804),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xFF12113C),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(res.getWidth(110.0),
                res.getWidth(50.0), res.getWidth(110.0), res.getWidth(30.0)),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  Image(
                    image: const AssetImage('assets/gavo_new.png'),
                    height: res.getHeight(150),
                    width: res.getWidth(150),
                  ),
                  SizedBox(height: res.getHeight(15)),
                  reusableTextField(
                      'Email Address',
                      _emailController,
                      false,
                      const Icon(Icons.alternate_email,
                          color: Color(0xFF12113C)),
                      validateEmail,
                      res),
                  SizedBox(height: res.getHeight(11)),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isShown = !isShown;
                            });
                          },
                          child: returnText(
                            text: isShown ? 'Show Password' : 'Hide Password',
                            color: Colors.white,
                            isHeading: false,
                            res: res,
                            size: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: res.getHeight(6)),
                  reusableTextField(
                      'Password',
                      _passwordController,
                      isShown,
                      const Icon(
                        Icons.lock,
                        color: Color(0xFF12113C),
                      ),
                      validatePassword,
                      res),
                  SizedBox(height: res.getHeight(20)),
                  signInsignUp(context, res, 'LOGIN', () {
                    if (_key.currentState!.validate()) {
                      Get.snackbar('ALERT', 'LOGGED');
                      Navigator.pushNamed(context, '/dashboard');
                    }
                  }),
                  SizedBox(height: res.getHeight(6)),
                  returnText(
                    text: 'Forgot Password?',
                    color: Colors.white,
                    isHeading: false,
                    res: res,
                    size: 15,
                  ),
                  SizedBox(height: res.getHeight(80)),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        returnText(
                          text: 'Need Help?',
                          color: Colors.white,
                          isHeading: false,
                          res: res,
                          size: 14,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
