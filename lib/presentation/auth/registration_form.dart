import 'package:flutter/material.dart';
import 'package:myapp/core/constants/auth_constants.dart';

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
          decoration: const InputDecoration(
            labelText: AppStrings.phoneLabel,
          ),
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: AppDimensions.normal3XSpacing),
        ElevatedButton(onPressed: onRegister, child: const Text(AppStrings.registerButton)),
      ],
    );
  }
}

