import 'package:flutter/material.dart';
import 'package:section_a/routes/routes.dart';

void main() {
  runApp(const MaterialApp(
    onGenerateRoute: AppRoutes.onGenerateRoute,
    initialRoute: AppRoutes.login,
  ));
}
