import 'package:myapp/core/app/base_cubit.dart';
import 'package:myapp/core/constants/app_strings.dart';

/// Holds UI state for authentication screens (login/register toggle, selected role).
class AuthUiState {
  /// Creates an [AuthUiState] with optional initial values.
  const AuthUiState({
    this.isLogin = true,
    this.selectedRole = AppStrings.defaultRole,
  });

  /// Whether the login form is currently shown.
  final bool isLogin;
  /// The currently selected user role.
  final String selectedRole;

  /// Returns a copy of this state with updated fields.
  AuthUiState copyWith({bool? isLogin, String? selectedRole}) => AuthUiState(
    isLogin: isLogin ?? this.isLogin,
      selectedRole: selectedRole ?? this.selectedRole,
    );
}

/// Manages UI state for authentication screens (login/register toggle, role selection).
class AuthUiCubit extends BaseCubit with BaseCubitMixin {
  /// Creates an [AuthUiCubit] with initial state.
  AuthUiCubit() : super(InitialState());

  /// The current UI state.
  AuthUiState _state = const AuthUiState();

  /// Returns the current UI state variables.
  AuthUiState get stateVars => _state;

  /// Toggles between login and registration forms.
  void toggleForm() {
    _state = _state.copyWith(isLogin: !_state.isLogin);
    emitSuccess(data: _state);
  }

  /// Sets the selected user role.
  void selectRole(String role) {
    _state = _state.copyWith(selectedRole: role);
    emitSuccess(data: _state);
  }

  /// Resets the UI state to its initial values.
  void reset() {
    _state = const AuthUiState();
    emitSuccess(data: _state);
  }
}
