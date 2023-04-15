import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

part 'settings.g.dart';

@collection
class AppSettings {
  static const Id idConstant = 1;
  final Id id = idConstant;

  @enumerated
  ThemeMode theme = ThemeMode.system;
}
