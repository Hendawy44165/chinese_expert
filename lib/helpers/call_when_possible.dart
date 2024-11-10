import 'package:flutter/material.dart';

callWhenPossible(VoidCallback callback) {
  WidgetsBinding.instance.addPostFrameCallback((_) => callback());
}
