import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/core/app/base_scaffold_manager.dart';
import 'package:myapp/core/app_router.dart';
import 'package:myapp/core/constants/app_constants.dart';
import 'package:myapp/core/constants/app_strings.dart';

/// Screen for selecting user role (Farmer or Buyer).
class RoleSelectionScreen extends BaseScaffoldManager {
  /// Creates a [RoleSelectionScreen].
  const RoleSelectionScreen({super.key});

  @override
  BaseScaffoldManagerState<RoleSelectionScreen> createState() =>
      _RoleSelectionScreenState();
}

class _RoleSelectionScreenState
    extends BaseScaffoldManagerState<RoleSelectionScreen> {
  String _selectedRole = AppStrings.farmerRole;

  void _onRoleSelected(String role) {
    setState(() {
      _selectedRole = role;
    });
  }

  @override
  bool get enableFAB => true;

  @override
  Widget buildFAB({VoidCallback? onPressed, IconData? icon}) => super.buildFAB(
    onPressed: () => context.go(AppRoute.auth.path, extra: _selectedRole),
    icon: Icons.arrow_forward,
  );

  @override
  PreferredSizeWidget? buildAppBar({String? appName}) =>
      super.buildAppBar(appName: AppStrings.roleSelectionTitle);

  @override
  Widget buildBody(BuildContext context) => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppStrings.roleLabel,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ChoiceChip(
              label: const Text(AppStrings.farmerRole),
              selected: _selectedRole == AppStrings.farmerRole,
              onSelected: (selected) {
                if (selected) _onRoleSelected(AppStrings.farmerRole);
              },
            ),
            const SizedBox(width: 24),
            ChoiceChip(
              label: const Text(AppStrings.buyerRole),
              selected: _selectedRole == AppStrings.buyerRole,
              onSelected: (selected) {
                if (selected) _onRoleSelected(AppStrings.buyerRole);
              },
            ),
          ],
        ),
      ],
    ),
  );
}
