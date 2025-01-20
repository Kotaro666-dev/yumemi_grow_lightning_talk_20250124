import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:yumemi_grow_lightning_talk_20250124/domain/model/permission.dart';
import 'package:yumemi_grow_lightning_talk_20250124/domain/model/role.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String name,
    required Role role,
    required List<Permission> permissions,
  }) = _User;
}