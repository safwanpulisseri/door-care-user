import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ToastificationWidget {
  static void show({
    required BuildContext context,
    required ToastificationType type,
    required String title,
    required String description,
    ToastificationStyle style = ToastificationStyle.flatColored,
    Duration autoCloseDuration = const Duration(seconds: 5),
    Alignment alignment = Alignment.topRight,
    Color? backgroundColor,
    Color? textColor,
  }) {
    toastification.show(
      context: context,
      type: type,
      style: style,
      autoCloseDuration: autoCloseDuration,
      title: Text(
        title,
        style: TextStyle(color: textColor),
      ),
      description: RichText(
        text: TextSpan(
          text: description,
          style: TextStyle(color: textColor),
        ),
      ),
      alignment: alignment,
      backgroundColor: backgroundColor,
    );
  }
}
