// lib/screens/auth/widgets/or_divider.dart
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('OR', style: Theme.of(context).textTheme.bodySmall));
  }
}
