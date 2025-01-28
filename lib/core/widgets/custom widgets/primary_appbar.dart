import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showWarningIcon;
  final VoidCallback onSetupTap;

  const PrimaryAppBar({
    super.key,
    this.showWarningIcon = false,
    required this.onSetupTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      title: Row(
        children: [
          Image.asset(
            "assets/icons/scooter_image.png",
          ),
          const SizedBox(width: 3),
        ],
      ),
      actions: [
        if (showWarningIcon)
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Image.asset(
              'assets/icons/warn_you.png',
              width: 18,
              height: 18,
            ),
          ),
        GestureDetector(
          onTap: onSetupTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Set me up first',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.background),
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.person, color: AppColors.primary),
          onPressed: onSetupTap,
        ),
      ],
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(1.0),
        child: Divider(color: AppColors.grey, height: 1),
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(57); // AppBar height + divider
}
