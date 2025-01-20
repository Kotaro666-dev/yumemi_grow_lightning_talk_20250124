import 'package:yumemi_grow_lightning_talk_20250124/domain/model/permission.dart';
import 'package:yumemi_grow_lightning_talk_20250124/domain/model/role.dart';
import 'package:yumemi_grow_lightning_talk_20250124/domain/model/user.dart';

final List<User> mockUsers = [
  User(
    role: Role.admin,
    permissions: [
      Permission.dashboard,
      Permission.students,
      Permission.chat,
      Permission.setting,
    ],
    name: 'Admin User',
  ),
  User(
    role: Role.professor,
    permissions: [
      Permission.dashboard,
      Permission.chat,
      Permission.setting,
    ],
    name: 'Professor John',
  ),
  User(
    role: Role.student,
    permissions: [
      Permission.dashboard,
      Permission.chat,
      Permission.setting,
    ],
    name: 'Student Alice',
  ),
  User(
    role: Role.student,
    permissions: [
      Permission.setting,
    ],
    name: 'Ex-Student Bob',
  ),
];