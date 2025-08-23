import 'package:flutter/material.dart';
import 'package:myapp/core/constants/app_constants.dart';

/// A widget for selecting user roles using chips.
class RoleSelectionChips extends StatelessWidget {
  /// Creates a [RoleSelectionChips] widget.
  const RoleSelectionChips({
    super.key,
    required this.selectedRole,
    required this.onRoleSelected,
  });

  /// The currently selected role.
  final String selectedRole;

  /// Callback when a role is selected.
  final ValueChanged<String> onRoleSelected;

  /// Builds the role selection chips UI.
  @override
  Widget build(BuildContext context) =>
      Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.roleLabel,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: AppDimensions.normalSpacing),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ChoiceChip(
              label: const Text(AppStrings.farmerRole),
              selected: selectedRole == AppStrings.farmerRole,
              onSelected: (selected) {
                if (selected) {
                  onRoleSelected(AppStrings.farmerRole);
                }
              },
            ),
            const SizedBox(width: AppDimensions.normal3XSpacing),
            ChoiceChip(
              label: const Text(AppStrings.buyerRole),
              selected: selectedRole == AppStrings.buyerRole,
              onSelected: (selected) {
                if (selected) {
                  onRoleSelected(AppStrings.buyerRole);
                }
              },
            ),
          ],
        ),
      ],
    );
}
