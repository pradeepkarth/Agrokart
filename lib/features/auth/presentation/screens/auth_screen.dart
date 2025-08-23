import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/app/base_cubit.dart';
import 'package:myapp/core/app/base_scaffold_manager.dart';
import 'package:myapp/core/constants/app_constants.dart';
import 'package:myapp/core/utils/locator.dart';
import 'package:myapp/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:myapp/features/auth/presentation/bloc/auth_ui_cubit.dart';
import 'package:myapp/features/auth/presentation/widgets/login_form.dart';
import 'package:myapp/features/auth/presentation/widgets/registration_form.dart';
import 'package:myapp/features/auth/presentation/widgets/role_selection_chips.dart';

/// The authentication screen for login and registration.
class AuthScreen extends BaseScaffoldManager {
  /// Creates an [AuthScreen] widget.
  const AuthScreen({super.key});

  /// Creates the state for [AuthScreen].
  @override
  BaseScaffoldManagerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends BaseScaffoldManagerState<AuthScreen> {
  @override
  BaseCubit get baseCubit => _authCubit;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  late final AuthCubit _authCubit;
  late final AuthUiCubit _authUiCubit;

  @override
  void initState() {
    super.initState();
    _authCubit = getIt<AuthCubit>();
    _authUiCubit = AuthUiCubit();
  }

  void _toggleForm() {
    _authUiCubit.toggleForm();
  }

  void _selectRole(String role) {
    _authUiCubit.selectRole(role);
  }

  void _authenticate(AuthUiState uiState) {
    if (uiState.isLogin) {
      _authCubit.login(
        email: _emailController.text,
        password: _passwordController.text,
        role: uiState.selectedRole,
      );
    } else {
      _authCubit.register(
        email: _emailController.text,
        password: _passwordController.text,
        confirmPassword: _confirmPasswordController.text,
        phone: _phoneController.text,
        role: uiState.selectedRole,
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
  Widget buildBody(BuildContext context) => MultiBlocProvider(
    providers: [
        BlocProvider<AuthCubit>(create: (_) => _authCubit),
        BlocProvider<AuthUiCubit>(create: (_) => _authUiCubit),
      ],
      child: BlocBuilder<AuthUiCubit, BaseState>(
        builder: (context, state) {
          final uiState =
              state is SuccessState<AuthUiState> && state.data != null
              ? state.data!
              : const AuthUiState();
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.largeSpacing),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (uiState.isLogin)
                    LoginForm(
                      emailController: _emailController,
                      passwordController: _passwordController,
                      onLogin: () => _authenticate(uiState),
                      onToggleToRegister: _toggleForm,
                    )
                  else
                    RegistrationForm(
                      emailController: _emailController,
                      passwordController: _passwordController,
                      confirmPasswordController: _confirmPasswordController,
                      phoneController: _phoneController,
                      onRegister: () => _authenticate(uiState),
                      onToggleToLogin: _toggleForm,
                    ),
                  const SizedBox(height: AppDimensions.normal3XSpacing),
                  RoleSelectionChips(
                    selectedRole: uiState.selectedRole,
                    onRoleSelected: _selectRole,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
}
