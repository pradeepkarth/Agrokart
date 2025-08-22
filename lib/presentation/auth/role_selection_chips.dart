import 'package:flutter/material.dart';
import 'package:myapp/core/constants/auth_constants.dart';

class RoleSelectionChips extends StatelessWidget {
  const RoleSelectionChips({
    Key? key,
    required this.selectedRole,
    required this.onRoleSelected,
  }) : super(key: key);

  final String selectedRole;
  final ValueChanged<String> onRoleSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
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
}
