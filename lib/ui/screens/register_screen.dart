import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/data/service/network_client.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

import '../../data/utils/urls.dart';
import '../widgets/centered_circular_progress_indicator.dart';
import '../widgets/snack_bar_message.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _passwordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNamelController = TextEditingController();
  final TextEditingController _lastNamelController = TextEditingController();
  final TextEditingController _phoneNumberlController = TextEditingController();
  final TextEditingController _passwordlController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _registrationInProgress = false;
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
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Text(
                      'Join With Us',
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
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter Your First Name';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      controller: _firstNamelController,
                      decoration: const InputDecoration(
                        hintText: 'First Name',
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter Your Last Name';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      controller: _lastNamelController,
                      decoration: const InputDecoration(
                        hintText: 'Last Name',
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      validator: (String? value) {
                        String phone = value?.trim() ?? '';
                        RegExp regExp =
                            RegExp(r"^(?:\+?88|0088)?01[1-9]\d{8}$");
                        if (regExp.hasMatch(phone) == false) {
                          return "Enter Your Valid Phone Number";
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      controller: _phoneNumberlController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Phone Number',
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      validator: (String? value) {
                        if ((value?.isEmpty ?? true) || (value!.length < 6)) {
                          return 'Enter Your Password More Than 6 Letters';
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
                    const SizedBox(height: 24),
                    Visibility(
                      visible: _registrationInProgress == false,
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
                      child: RichText(
                          text: TextSpan(
                              style: const TextStyle(
                                  color: Colors.black45,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                              children: [
                            TextSpan(text: "Already have An account? "),
                            TextSpan(
                              text: "Sign In",
                              style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600),
                              recognizer: TapGestureRecognizer()
                                ..onTap = _onTapSigninButton,
                            ),
                          ])),
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
    if (formKey.currentState!.validate()) {
      _registerUser();
    }
  }

  Future<void> _registerUser() async {
    _registrationInProgress = true;
    setState(() {});
    Map<String, dynamic> requestBody = {
      "email": _emailController.text.trim(),
      "firstName": _firstNamelController.text.trim(),
      "lastName": _lastNamelController.text.trim(),
      "mobile": _phoneNumberlController.text.trim(),
      "password": _passwordlController.text,
    };
    NetworkResponse response = await NetworkClient.postRequest(
        url: Urls.registerUrl, body: requestBody);
    _registrationInProgress = false;
    setState(() {});
    if (response.isSuccess) {
      showSnackBarMessage(context, 'User registered successfully!');
    } else {
      showSnackBarMessage(context, response.errorMessage, true);
    }

  }

  void _clearTextFields() {
    _emailController.clear();
    _firstNamelController.clear();
    _lastNamelController.clear();
    _phoneNumberlController.clear();
    _passwordlController.clear();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _firstNamelController.dispose();
    _lastNamelController.dispose();
    _phoneNumberlController.dispose();
    _passwordlController.dispose();
    super.dispose();
  }

  void _onTapSigninButton() {
    Navigator.pop(context);
  }
}
