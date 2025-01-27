import 'package:flutter/material.dart';

class ViewMoreButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ViewMoreButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      width: 200,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary, // Green background
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0), // Fully rounded edges
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min, // Adjust size to content
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.surface, // White text
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8.0), // Spacing between text and icon
            const Icon(
              Icons.arrow_forward_ios, // Arrow icon
              color: Colors.white,
              size: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
