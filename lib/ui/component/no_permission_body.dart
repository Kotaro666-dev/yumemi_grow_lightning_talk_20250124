import 'package:flutter/material.dart';

class NoPermissionBody extends StatelessWidget {
  const NoPermissionBody({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 40,
          ),
          SizedBox(height: 16),
          Text(
            'You do not have permission to access this page.',
            style: textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
