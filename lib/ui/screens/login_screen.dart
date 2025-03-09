import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(
              child: Padding(
            padding: const EdgeInsets.all(32),
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
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Icon(Icons.arrow_circle_right_outlined),
                ),
                const SizedBox(
                  height: 32,
                ),
                Center(
                  child: Column(
                    children: [
                      TextButton(
                          onPressed: _onTapForgotButton,
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
                              text: "Sign In",
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
          ))
        ],
      ),
    );
  }

  void _onTapForgotButton() {
    // Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotScreen()));
  }
  void _onTapSigninButton() {
    // Navigator.push(context, MaterialPageRoute(builder: (context) => SigninScreen()));
  }
}
