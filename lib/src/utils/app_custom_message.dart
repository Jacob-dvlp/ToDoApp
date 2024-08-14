import 'package:flutter/material.dart';
import 'package:todo_app/src/utils/app_theme.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

sealed class Messages {
  static void showInfo(BuildContext context, String message) {
    showTopSnackBar(Overlay.of(context), CustomSnackBar.info(message: message));
  }

  static showSuccess(BuildContext context, String message) {
    return showTopSnackBar(
      displayDuration:  const Duration(seconds: 3),
      snackBarPosition: SnackBarPosition.top,
      Overlay.of(context),
      CustomSnackBar.success(
        
        key: const Key("CustomSnackBarSuccess"),
        backgroundColor: primaryColor,
        message: message,
        messagePadding: const EdgeInsets.symmetric(horizontal: 26),
      ),
    );
  }

  static showError(BuildContext context, String message) {
    return showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        key: const Key("CustomSnackBarError"),
        message: message,
      ),
      snackBarPosition: SnackBarPosition.top,
    );
  }
}
