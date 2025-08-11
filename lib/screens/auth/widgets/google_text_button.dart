import 'package:flutter/material.dart';

class GoogleTextButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const GoogleTextButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton.icon(
      icon: Image.asset(
        'assets/google_logo.png', // Hardcoded asset path
        height: 22.0, // Adjusted for typical ElevatedButton icon sizing
        width: 22.0,
      ),
      label: Text(
        label,
        style: TextStyle(
          color: Colors.black, // Explicitly black text
          fontSize: theme.textTheme.labelLarge?.fontSize ?? 14.0,
          fontWeight: FontWeight.w500, // Medium weight for button text
        ),
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black, // For ripple, and affects icon if not colored
        minimumSize: const Size(double.infinity, 48), // Adjusted height
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0), // Consistent rounding
          side: BorderSide(
            color: theme.colorScheme.outline.withOpacity(0.7), // Subtle border
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        elevation: 1.0, // Slight elevation
      ),
    );
  }
}
