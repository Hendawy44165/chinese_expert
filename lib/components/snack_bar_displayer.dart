import 'package:chinese_expert/helpers/theming/colors.dart';
import 'package:chinese_expert/helpers/theming/text.dart';
import 'package:flutter/material.dart';

void displaySnackBar(BuildContext context, String message) =>
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message, style: TextStylesManager.black24Bold),
            backgroundColor: ColorsManager.red,
          ),
        );
      },
    );
