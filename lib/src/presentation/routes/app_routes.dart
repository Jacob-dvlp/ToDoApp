import 'package:flutter/material.dart';

class AppRoutes {
  static void pushReplecement(
      {required BuildContext context, required Widget page}) {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return page;
      },
    ));
  }

  static void go({required BuildContext context, required Widget page}) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return page;
      },
    ));
  }

  static void close({required BuildContext context}) {
    Navigator.pop(context);
  }
}
