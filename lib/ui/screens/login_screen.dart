import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/forgot_password_verify_email_screen.dart';
import 'package:task_manager/ui/screens/main_bottom_nav_screen.dart';
import 'package:task_manager/ui/screens/register_screen.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

import '../../data/service/network_client.dart';
import '../../data/utils/urls.dart';
import '../widgets/centered_circular_progress_indicator.dart';
import '../widgets/snack_bar_message.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  bool _passwordVisible = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordlController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool _loginInProgress = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Text(
                      'Get Start With',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      validator: (String? value) {
                        String email = value?.trim() ?? '';
                        if (EmailValidator.validate(email) == false) {
                          return "Enter a valid email";
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      validator: (String? value) {
                        if ((value?.isEmpty ?? true) || (value!.length < 6)) {
                          return 'Enter Your Currect Password';
                        }
                        return null;
                      },
                      controller: _passwordlController,
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black45,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Visibility(
                      visible: _loginInProgress == false,
                      replacement: CenteredCircularProgressIndicator(),
                      child: ElevatedButton(
                        onPressed: _onTabSubmitButton,
                        child: const Icon(Icons.arrow_circle_right_outlined),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Center(
                      child: Column(
                        children: [
                          TextButton(
                              onPressed: _onTapForgotPasswordButton,
                              child: Text('Forgot Password')),
                          RichText(
                              text: TextSpan(
                                  style: const TextStyle(
                                      color: Colors.black45,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                  children: [
                                TextSpan(text: "Don't have account? "),
                                TextSpan(
                                  text: "Sign Up",
                                  style: const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w600),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = _onTapSigninButton,
                                ),
                              ])),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }

  void _onTabSubmitButton() {
    if (formkey.currentState!.validate()) {
      _login();
    }
  }

  Future<void> _login() async {
    _loginInProgress = true;
    setState(() {});
    Map<String, dynamic> requestBody = {
      "email": _emailController.text.trim(),
      "password": _passwordlController.text,
    };
    NetworkResponse response =
        await NetworkClient.postRequest(url: Urls.loginUrl, body: requestBody);
    _loginInProgress = false;
    setState(() {});
    if (response.isSuccess) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MainBottomNavScreen()),
          (predicate) => false);
    } else {
      showSnackBarMessage(context, response.errorMessage, true);
    }
  }

  void _onTapForgotPasswordButton() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ForgotPasswordVerifyEmailScreen()));
  }

  void _onTapSigninButton() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RegisterScreen()));
  }

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordlController.dispose();
    super.dispose();
  }
}
