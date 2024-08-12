import 'package:flutter/material.dart';
import 'package:todo_app/app_exports.dart';

import '../../utils/app_theme.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 130,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            top: 50,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "lartej@gmail.com",
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: CircleAvatar(
                  backgroundColor: primaryColor,
                  child: const Text("J"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(0, 280);
}
