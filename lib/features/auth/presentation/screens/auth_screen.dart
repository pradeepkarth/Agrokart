import 'package:flutter/material.dart';
import 'package:myapp/features/auth/presentation/screens/login_form.dart';
import 'package:myapp/features/auth/presentation/screens/registration_form.dart';
import 'package:myapp/features/auth/presentation/widgets/role_selection_chips.dart';
import 'package:myapp/core/constants/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/utils/locator.dart';
import 'package:myapp/features/auth/presentation/bloc/auth_bloc.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  late final AuthCubit _authCubit;

  bool _isLogin = true;
  String _selectedRole = AppStrings.defaultRole;

  @override
  void initState() {
    super.initState();
  _authCubit = getIt<AuthCubit>();
  }

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
      _authCubit.login(
        email: _emailController.text,
        password: _passwordController.text,
        role: _selectedRole,
      );
    } else {
      _authCubit.register(
        email: _emailController.text,
        password: _passwordController.text,
        confirmPassword: _confirmPasswordController.text,
        phone: _phoneController.text,
        role: _selectedRole,
      );
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
    return BlocProvider<AuthCubit>(
      create: (_) => _authCubit,
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            // Show loading indicator or snackbar
          } else if (state is AuthSuccess) {
            // Navigate or show success
          } else if (state is AuthFailure) {
            // Show error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(_isLogin ? AppStrings.loginTitle : AppStrings.registerTitle),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.largeSpacing),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
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
                  const SizedBox(height: AppDimensions.normal3XSpacing),
                  RoleSelectionChips(
                    selectedRole: _selectedRole,
                    onRoleSelected: _selectRole,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
