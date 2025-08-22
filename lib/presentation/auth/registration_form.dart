import 'package:flutter/material.dart';

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.phoneController,
    this.onRegister,
    this.onToggleToLogin,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController phoneController;
  final VoidCallback? onRegister;
  final VoidCallback? onToggleToLogin;

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
        const SizedBox(height: 12.0),
        TextFormField(
          controller: confirmPasswordController,
          decoration: const InputDecoration(
            labelText: 'Confirm Password',
          ),
          obscureText: true,
        ),
        const SizedBox(height: 12.0),
        TextFormField(
          controller: phoneController,
          decoration: const InputDecoration(
            labelText: 'Phone Number (Optional)',
          ),
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 24.0),
        ElevatedButton(onPressed: onRegister, child: const Text('Register')),
      ],
    );
  }
}
