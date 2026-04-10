import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    required this.actionText,
    required this.onActionPressed,
  });

  final String title;
  final String actionText;
  final VoidCallback onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
          ),
        ),
        TextButton(
          onPressed: onActionPressed,
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primaryOrange,
            textStyle: const TextStyle(fontWeight: FontWeight.w800),
          ),
          child: Text(actionText),
        ),
      ],
    );
  }
}
