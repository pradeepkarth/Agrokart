import 'package:flutter/material.dart';
import 'package:myapp/core/constants/auth_constants.dart';

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
            labelText: AppStrings.emailLabel,
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: AppDimensions.min3XSpacing),
        TextFormField(
          controller: passwordController,
          decoration: const InputDecoration(
            labelText: AppStrings.passwordLabel,
          ),
          obscureText: true,
        ),
        const SizedBox(height: AppDimensions.normal3XSpacing),
        ElevatedButton(
          onPressed: onLogin,
          child: const Text(AppStrings.loginButton),
        ),
      ],
    );
  }
}

