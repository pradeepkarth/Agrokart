import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required this.onLogin,
    required this.onToggleToRegister,
 required this.emailController,
 required this.passwordController,
  }) : super(key: key);

  final VoidCallback onLogin;
  final VoidCallback onToggleToRegister;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          controller: emailController,
          decoration: const InputDecoration(
            labelText: 'Email',
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 12.0),
        TextFormField(
          controller: passwordController,
          decoration: const InputDecoration(
            labelText: 'Password',
          ),
          obscureText: true,
        ),
        const SizedBox(height: 24.0),
        ElevatedButton(
          onPressed: onLogin,
          child: const Text('Login'),
        ),
      ],
    );
  }
}
