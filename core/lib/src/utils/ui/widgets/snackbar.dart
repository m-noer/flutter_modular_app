import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:get/get.dart';

class AppSnackbar {
  static void snackbarFailure(String title, String message) {
    Get.snackbar(
      title,
      message,
      colorText: Colors.white,
      backgroundColor: Palette.danger,
      margin: const EdgeInsets.all(10),
      maxWidth: 400,
      icon: const Icon(
        Icons.dangerous,
        color: Colors.white,
        key: Key('fail'),
      ),
      duration: const Duration(seconds: 2),
    );
  }

  static void snackbarSuccess(String title, String message) {
    Get.snackbar(
      title,
      message,
      colorText: Colors.white,
      backgroundColor: Colors.green,
      margin: const EdgeInsets.all(10),
      maxWidth: 400,
      icon: const Icon(
        Icons.info,
        color: Colors.white,
      ),
      duration: const Duration(seconds: 2),
    );
  }
}
