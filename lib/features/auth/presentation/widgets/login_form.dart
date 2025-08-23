import 'package:flutter/material.dart';
import 'package:myapp/core/constants/app_constants.dart';

/// A form widget for user login.
class LoginForm extends StatelessWidget {
  /// Creates a [LoginForm] widget.
  const LoginForm({
    super.key,
    required this.onLogin,
    required this.onToggleToRegister,
    required this.emailController,
    required this.passwordController,
  });

  /// Callback when the login button is pressed.
  final VoidCallback onLogin;

  /// Callback when the toggle to register button is pressed.
  final VoidCallback onToggleToRegister;

  /// Controller for the email input field.
  final TextEditingController emailController;

  /// Controller for the password input field.
  final TextEditingController passwordController;

  /// Builds the login form UI.
  @override
  Widget build(BuildContext context) =>
      Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          controller: emailController,
          decoration: const InputDecoration(labelText: AppStrings.emailLabel),
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
