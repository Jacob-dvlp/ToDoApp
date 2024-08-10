import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

sealed class Messages {
  static void showInfo(BuildContext context, String message) {
    showTopSnackBar(Overlay.of(context), CustomSnackBar.info(message: message));
  }

  static showSuccess(BuildContext context, String message) {
    return showTopSnackBar(
      snackBarPosition: SnackBarPosition.top,
      Overlay.of(context),
      CustomSnackBar.success(
        backgroundColor: const Color(0XFF038dff),
        message: message,
        messagePadding: const EdgeInsets.symmetric(horizontal: 26),
      ),
    );
  }

  static showError(BuildContext context, String message) {
    return showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: message,
      ),
      snackBarPosition: SnackBarPosition.top,
    );
  }
}
