// lib/screens/auth/widgets/carousel_card.dart
import 'package:flutter/material.dart';

class CarouselCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon; // Added icon parameter

  const CarouselCard({
    required this.title,
    required this.subtitle,
    required this.icon, // Added icon parameter
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      surfaceTintColor: theme.colorScheme.primary.withOpacity(0.06),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)), // Increased border radius
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 76,
              height: 76,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient( // Added gradient
                  colors: [
                    theme.colorScheme.primary,
                    theme.colorScheme.primaryContainer,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [ // Added boxShadow
                  BoxShadow(
                    color: theme.colorScheme.primary.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(icon,
                  size: 36,
                  color: theme.colorScheme.onPrimary), // Added icon and color
            ),
            const SizedBox(width: 12),
            Expanded( // Wrapped Column in Expanded
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 6),
                  Text(subtitle, style: theme.textTheme.bodyMedium),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
