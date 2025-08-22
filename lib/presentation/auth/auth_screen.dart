import 'package:flutter/material.dart';

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
    } else {
      // TODO: Implement registration logic
      print('Registration attempt with:');
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');
      print('Confirm Password: ${_confirmPasswordController.text}');
      print('Phone: ${_phoneController.text}');
      print('Role: $_selectedRole');
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
              // Email and Password Fields
              if (_isLogin) ...[
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 12.0),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
              ] else ...[
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 12.0),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 12.0),
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 12.0),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number (Optional)',
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ],

              const SizedBox(height: 24.0),

              ElevatedButton(
                onPressed: _authenticate,
                child: Text(_isLogin ? 'Login' : 'Register'),
              ),
              const SizedBox(height: 16.0),

              // Toggle between Login and Register
              TextButton(
                onPressed: _toggleForm,
                child: Text(_isLogin
                    ? 'Don\'t have an account? Register'
                    : 'Already have an account? Login'),
              ),
              const SizedBox(height: 24.0),

              // Placeholder for Role Selection
              const Text(
                'Select your role:',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ChoiceChip(
                    label: const Text('Farmer'),
                    selected: _selectedRole == 'Farmer',
                    onSelected: (selected) => _selectRole('Farmer'),
                  ),
                  const SizedBox(width: 16.0),
                  ChoiceChip(
                    label: const Text('Buyer'),
                    selected: _selectedRole == 'Buyer',
                    onSelected: (selected) => _selectRole('Buyer'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}