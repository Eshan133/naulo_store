import 'package:flutter/material.dart';
import 'package:naulo/sign_in_up/signup_screen.dart';
import 'package:naulo/sign_in_up/widgets/input_textfield.dart';

import '../common/widgets/custom_text_field.dart';
import '../constants/global_variables.dart';
import '../features/auth/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login-screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final AuthService authService = AuthService();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  moveToSignupScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SignupScreen(),
      ),
    );
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Form(
            key: _signInFormKey,
            child: Column(
              children: [
                Flexible(
                  child: Container(),
                  flex: 2,
                ),
                Image.asset(
                  'assets/images/naulo2.jpg',
                  height: 150,
                  fit: BoxFit.fitHeight,
                ),
                // SvgPicture.asset(
                //   'assets/ic_instagram.svg',
                //   color: primaryColor,
                //   height: 64,
                // ),
                const SizedBox(
                  height: 64,
                ),
                //
                //Email
                CustomTextField(
                    controller: _emailController, hintText: "Enter Your Email"),
                const SizedBox(
                  height: 24,
                ),
                //
                //Password
                CustomTextField(
                    controller: _passwordController,
                    hintText: "Enter Your Password"),
                //
                //Button
                const SizedBox(
                  height: 24,
                ),
                GestureDetector(
                  onTap: () {
                    if (_signInFormKey.currentState!.validate()) {
                      signInUser();
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: GlobalVariable.selectedNavBarColor,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: const Center(
                      child: Text(
                        "Log in",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Flexible(
                  child: Container(),
                  flex: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text("Don't have an account?"),
                    ),
                    GestureDetector(
                      onTap: moveToSignupScreen,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          "Sign up",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
