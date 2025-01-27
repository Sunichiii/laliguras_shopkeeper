import 'package:flutter/material.dart';
import 'package:shopkeeper_part/core/constants/colors.dart';

class SecondaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackButtonPressed;

  const SecondaryAppBar({
    Key? key,
    required this.title,
    this.onBackButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      leading: IconButton(
        onPressed: onBackButtonPressed ?? () => Navigator.pop(context),
        icon: const Icon(
          Icons.arrow_back_ios_new, // iOS-style back arrow
          color: AppColors.black,
        ),
      ),
      centerTitle: true,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Divider(color: AppColors.grey, height: 1),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(57); // AppBar height + gray line
}
