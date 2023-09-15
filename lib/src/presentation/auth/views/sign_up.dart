import 'package:chat/src/core/shared/resources/app_image.dart';
import 'package:chat/src/core/shared/widgets/custom_buttons.dart';
import 'package:chat/src/core/shared/widgets/loader.dart';
import 'package:chat/src/core/shared/widgets/text_field.dart';
import 'package:chat/src/presentation/auth/strings.dart';
import 'package:chat/src/presentation/auth/views/sign_in.dart';
import 'package:chat/src/presentation/home/views/home_page.dart';
import 'package:chat/src/services/auth_service.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({
    super.key,
  });

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final fullnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final comfirmpasswordController = TextEditingController();
  final AuthService _authService = AuthService();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? (const Loader())
          : SafeArea(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //welcome back you've been missed
                      const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Let's get started",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 35),

                      //usernmae Textfield

                      MyTextField(
                        controller: fullnameController,
                        hintText: "Full Name",
                        obscureText: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your full Name';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 10),

                      //email textfield
                      MyTextField(
                        controller: emailController,
                        hintText: "Email",
                        errorText: emailError,
                        obscureText: false,
                        validator: (value) {
                          setState(() {
                            if (value!.length >= 8) {
                              if (RegExp(
                                      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                                  .hasMatch(value)) {
                                emailError = null;
                              } else {
                                emailError = 'Invalid email format';
                              }
                            } else {
                              emailError =
                                  'Email should be at least 8 characters long';
                            }
                          });
                          return null;
                        },
                      ),

                      const SizedBox(height: 10),

                      //password textfield
                      MyTextField(
                        controller: passwordController,
                        hintText: "Password",
                        obscureText: true,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 8) {
                            return 'Password must be minimum of 8 characters';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 10),

                      //comfirm password textfield

                      MyTextField(
                        controller: comfirmpasswordController,
                        hintText: "Comfirm Password",
                        obscureText: true,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 8) {
                            return 'Password must be minimum of 8 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      //forgot passeord
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forgot Password?",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // sign in labelLarge
                      MyButton(
                        onTap: signUserUp,
                        buttonText: "Sign Up",
                      ),

                      const SizedBox(height: 40),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.grey[400],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "Or continue with",
                                style: TextStyle(
                                  color: Colors.grey[700],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.grey[400],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),

                      Center(
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(16)),
                            child: Image.asset(
                              AppImages.google,
                              height: 40,
                            )),
                      ),
                      const Spacer(),
                      //Not a member? register
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Not a member?",
                            style: TextStyle(
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignIn()));
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  signUserUp() async {
    if (_formKey.currentState!.validate()) {
      if (passwordController.text != comfirmpasswordController.text) {
        return false;
      }
      setState(() {
        isLoading = true;
      });

      bool result = await _authService.createUserWithEmailAndPassword(
          emailController.text, passwordController.text);

      setState(() {
        isLoading = false;
      });

      if (result) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ));
      }
    }
  }
}
