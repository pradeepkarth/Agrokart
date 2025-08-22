import 'package:flutter/material.dart';

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
              selected: selectedRole == 'Farmer',
              onSelected: (selected) {
                if (selected) {
                  onRoleSelected('Farmer');
                }
              },
            ),
            const SizedBox(width: 16.0),
            ChoiceChip(
              label: const Text('Buyer'),
              selected: selectedRole == 'Buyer',
              onSelected: (selected) {
                if (selected) {
                  onRoleSelected('Buyer');
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
