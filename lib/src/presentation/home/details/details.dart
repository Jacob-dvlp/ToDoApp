import 'package:flutter/material.dart';
import 'package:todo_app/app_exports.dart';

import '../../../utils/app_theme.dart';
import '../../createtask/widgets/task_form_widge.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Programar'),
        centerTitle: true,
      ),
      floatingActionButton: CircleAvatar(
        backgroundColor: primaryColor,
        child: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              ModalBottomSheetRoute(
                  backgroundColor: Colors.white,
                  builder: (context) {
                    return const SizedBox(
                      height: 700,
                      child: TaskFormWidge(),
                    );
                  },
                  isScrollControlled: true),
            );
          },
          icon: const Icon(Icons.edit),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              child: Text(
                body,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
            const Text("03/junho/2012")
          ],
        ),
      ),
    );
  }
}

const body =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. laboris nisi ut aliquip ex ea commodo consequat.";
