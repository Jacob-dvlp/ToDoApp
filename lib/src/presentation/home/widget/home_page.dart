import 'package:flutter/material.dart';
import 'package:todo_app/src/presentation/createtask/create_task_page.dart';
import 'package:todo_app/src/presentation/routes/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      floatingActionButton: CircleAvatar(
        child: IconButton(
            onPressed: () {
              AppRoutes.go(
                context: context,
                page: const CreateTaskPage(),
              );
            },
            icon: const Icon(Icons.add)),
      ),
      body: Container(),
    );
  }
}
