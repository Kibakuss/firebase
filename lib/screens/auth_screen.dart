import 'package:firebase/widgets/auth_form.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final onAuth = isLogin ? () {} : () {};
    final buttonText = isLogin ? 'Login' : 'Register';
    return Scaffold(
      appBar: AppBar(title: Text('Firebase $buttonText')),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              AuthForm(
                  authButtonText: buttonText,
                  onAuth: onAuth,
                  emailController: emailController,
                  passwordController: passwordController),
              TextButton(
                  child: Text(buttonText),
                  onPressed: () {
                    setState(
                      () {
                        isLogin = !isLogin;
                      },
                    );
                  })
            ],
          )),
    );
  }
}
