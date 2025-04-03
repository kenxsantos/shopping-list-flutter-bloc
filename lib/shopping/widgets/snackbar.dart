import 'package:flutter/material.dart';

void showSnackBarMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message, style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.black,
      duration: Duration(milliseconds: 500),
    ),
  );
}
