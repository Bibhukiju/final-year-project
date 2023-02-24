import 'package:flutter/material.dart';

void showSnackBarWidget(
    {required BuildContext ctx,
    required String message,
    Color color = Colors.black,
    Duration duration = const Duration(seconds: 1)}) {
  ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
    content: Text(message.toUpperCase(), textAlign: TextAlign.center,),
    backgroundColor: color,
    duration: duration,
  ));
}
