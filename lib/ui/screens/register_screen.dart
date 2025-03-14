import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _passwordVisible = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNamelController = TextEditingController();
  final TextEditingController _lastNamelController = TextEditingController();
  final TextEditingController _phoneNumberlController = TextEditingController();
  final TextEditingController _passwordlController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
                      height: 24
                    ),
                    ElevatedButton(
                      onPressed: _onTabSubmitButton,
                      child: const Icon(Icons.arrow_circle_right_outlined),
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

  void _onTabSubmitButton() {}

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
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
