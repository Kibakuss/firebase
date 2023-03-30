import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  final VoidCallback onAuth;
  final String authButtonText;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const AuthForm(
      {super.key,
      required this.onAuth,
      required this.authButtonText,
      required this.emailController,
      required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextFormField(
          controller: emailController,
          decoration: const InputDecoration(labelText: 'Email')),
      TextFormField(
          controller: passwordController,
          decoration: const InputDecoration(labelText: 'Password')),
      const SizedBox(height: 16.0),
      ElevatedButton(onPressed: onAuth, child: Text(authButtonText)),
      const SizedBox(height: 16.0),
      ElevatedButton.icon(
        onPressed: null,
        icon: Image.network(
            'https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-32.png'),
        label: const Text('Sign in with Google'),
      ),
    ]);
  }
}
