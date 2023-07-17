import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:naulo/sign_in_up/widgets/input_textfield.dart';

import '../constants/global_variables.dart';
import '../features/auth/services/auth_service.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _signUpFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Uint8List? _image;

  @override
  void dispose() {
    super.dispose();
    // TODO: implement dispose
    _emailController.dispose();
    _bioController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _usernameController.text,
    );
  }

  moveToLoginScreen() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const LoginScreen(),
    ));
  }

  // void selectImage() async {
  //   Uint8List img = await pickImage(ImageSource.gallery);
  //   setState(() {
  //     _image = img;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Form(
            key: _signUpFormKey,
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
                //   "assets/ic_instagram.svg",
                //   color: primaryColor,
                //   height: 64,
                // ),
                const SizedBox(
                  height: 45,
                ),
                //
                //Profile Picture
                Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(
                            radius: 64,
                            backgroundImage: MemoryImage(_image!),
                          )
                        : const CircleAvatar(
                            radius: 64,
                            backgroundImage: NetworkImage(
                                "https://moonvillageassociation.org/wp-content/uploads/2018/06/default-profile-picture1-744x744.jpg"),
                          ),
                    Positioned(
                      left: 90,
                      top: 90,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add_a_photo),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                //
                //Username
                InputTextField(
                    textEditingController: _usernameController,
                    textInputType: TextInputType.text,
                    hintText: "Enter your Username"),
                const SizedBox(
                  height: 24,
                ),
                //
                //Email
                InputTextField(
                    textEditingController: _emailController,
                    textInputType: TextInputType.emailAddress,
                    hintText: "Enter your Email Address"),
                const SizedBox(
                  height: 24,
                ),
                //
                //Password
                InputTextField(
                    textEditingController: _passwordController,
                    textInputType: TextInputType.text,
                    hintText: "Enter your Password"),
                const SizedBox(
                  height: 24,
                ),
                //
                //Bio
                // InputTextField(
                //     textEditingController: _bioController,
                //     textInputType: TextInputType.text,
                //     hintText: "Enter your bio"),
                // const SizedBox(
                //   height: 24,
                // ),
                GestureDetector(
                  onTap: () {
                    if (_signUpFormKey.currentState!.validate()) {
                      signUpUser();
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: GlobalVariable.selectedNavBarColor),
                    child: const Center(
                      child: Text(
                        "Sign up",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
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
                      child: const Text("Already have an accout?"),
                    ),
                    GestureDetector(
                      onTap: moveToLoginScreen,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          "Log in",
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
