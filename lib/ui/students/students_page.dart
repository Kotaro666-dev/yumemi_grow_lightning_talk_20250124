import 'package:flutter/material.dart';
import 'package:yumemi_grow_lightning_talk_20250124/ui/component/no_permission_body.dart';

class StudentsPage extends StatelessWidget {
  const StudentsPage({
    super.key,
    bool canAccess = true,
  }) : _canAccess = canAccess;

  final bool _canAccess;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return _canAccess
        ? Center(
            child: Text(
              'Students Page',
              style: textTheme.headlineMedium,
            ),
          )
        : NoPermissionBody();
  }
}
