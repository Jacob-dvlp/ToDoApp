import 'package:flutter/material.dart';
import 'package:todo_app/src/presentation/createtask/widgets/task_form_widge.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({super.key});

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Task'),
        centerTitle: true,
      ),
      body: const TaskFormWidge()
    );
  }
}
