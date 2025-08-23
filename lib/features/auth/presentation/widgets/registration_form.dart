import 'package:flutter/material.dart';
import 'package:myapp/core/constants/app_constants.dart';

/// A form widget for user registration.
class RegistrationForm extends StatelessWidget {
  /// Creates a [RegistrationForm] widget.
  const RegistrationForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.phoneController,
    this.onRegister,
    this.onToggleToLogin,
  });

  /// Controller for the email input field.
  final TextEditingController emailController;

  /// Controller for the password input field.
  final TextEditingController passwordController;

  /// Controller for the confirm password input field.
  final TextEditingController confirmPasswordController;

  /// Controller for the phone input field.
  final TextEditingController phoneController;

  /// Callback when the register button is pressed.
  final VoidCallback? onRegister;

  /// Callback when the toggle to login button is pressed.
  final VoidCallback? onToggleToLogin;

  /// Builds the registration form UI.
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
        const SizedBox(height: AppDimensions.min3XSpacing),
        TextFormField(
          controller: confirmPasswordController,
          decoration: const InputDecoration(
            labelText: AppStrings.confirmPasswordLabel,
          ),
          obscureText: true,
        ),
        const SizedBox(height: AppDimensions.min3XSpacing),
        TextFormField(
          controller: phoneController,
          decoration: const InputDecoration(labelText: AppStrings.phoneLabel),
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: AppDimensions.normal3XSpacing),
        ElevatedButton(
          onPressed: onRegister,
          child: const Text(AppStrings.registerButton),
        ),
      ],
    );
}
