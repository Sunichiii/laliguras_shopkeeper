import 'package:flutter/material.dart';
import 'package:shopkeeper_part/core/constants/colors.dart';

class SendReceiveButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SendReceiveButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150, // Takes full width if needed
      height: 40.0, // Fixed height
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary, // Green background
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Rounded edges
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
      ),
    );
  }
}
