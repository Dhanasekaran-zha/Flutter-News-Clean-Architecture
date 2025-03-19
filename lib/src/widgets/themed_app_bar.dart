
import 'package:flutter/material.dart';

AppBar themedAppBar(String title, [List<Widget>? actionIcons]) {
  return AppBar(
    title: Text(title),
    actions: actionIcons,
  );
}