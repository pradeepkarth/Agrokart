import 'package:flutter/material.dart';
import 'package:myapp/presentation/auth/login_form.dart';
import 'package:myapp/presentation/auth/registration_form.dart';
import 'package:myapp/presentation/auth/role_selection_chips.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isLogin = true;
  String _selectedRole = 'Farmer'; // Default role

  void _toggleForm() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  void _selectRole(String role) {
    setState(() {
      _selectedRole = role;
    });
  }

  void _authenticate() {
    if (_isLogin) {
      // TODO: Implement login logic
      print('Login attempt with:');
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');
      print('Role: $_selectedRole');
      // TODO: Navigate to appropriate dashboard based on _selectedRole
    } else {
      // TODO: Implement registration logic
      print('Registration attempt with:');
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');
      print('Confirm Password: ${_confirmPasswordController.text}');
      print('Phone: ${_phoneController.text}');
      print('Role: $_selectedRole');
      // TODO: Navigate to appropriate onboarding screen based on _selectedRole
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLogin ? 'Login' : 'Register'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Use LoginForm or RegistrationForm based on _isLogin
              if (_isLogin)
                LoginForm(
                  emailController: _emailController,
                  passwordController: _passwordController,
                  onLogin: _authenticate,
                  onToggleToRegister: _toggleForm,
                )
              else
                RegistrationForm(
                  emailController: _emailController,
                  passwordController: _passwordController,
                  confirmPasswordController: _confirmPasswordController,
                  phoneController: _phoneController,
                  onRegister: _authenticate,
                  onToggleToLogin: _toggleForm,
                ),

              const SizedBox(height: 24.0),

              // Use RoleSelectionChips widget
              RoleSelectionChips(
                selectedRole: _selectedRole,
                onRoleSelected: _selectRole,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
