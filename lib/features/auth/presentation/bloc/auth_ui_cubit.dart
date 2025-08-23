import 'package:myapp/core/app/base_cubit.dart';
import 'package:myapp/core/constants/app_strings.dart';

class AuthUiState {
  final bool isLogin;
  final String selectedRole;
  const AuthUiState({
    this.isLogin = true,
    this.selectedRole = AppStrings.defaultRole,
  });

  AuthUiState copyWith({bool? isLogin, String? selectedRole}) {
    return AuthUiState(
      isLogin: isLogin ?? this.isLogin,
      selectedRole: selectedRole ?? this.selectedRole,
    );
  }
}

class AuthUiCubit extends BaseCubit with BaseCubitMixin {
  AuthUiCubit() : super(InitialState());

  AuthUiState _state = const AuthUiState();
  AuthUiState get stateVars => _state;

  void toggleForm() {
    _state = _state.copyWith(isLogin: !_state.isLogin);
    emitSuccess(data: _state);
  }

  void selectRole(String role) {
    _state = _state.copyWith(selectedRole: role);
    emitSuccess(data: _state);
  }

  void reset() {
    _state = const AuthUiState();
    emitSuccess(data: _state);
  }
}
