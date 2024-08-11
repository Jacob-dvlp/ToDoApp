import 'package:todo_app/app_exports.dart';

import '../../../utils/app_custom_message.dart';
import '../../home/home_page.dart';
import '../../routes/app_routes.dart';
import '../../shared/controller/task_cubit.dart';

class TaskFormWidge extends StatefulWidget {
  const TaskFormWidge({super.key});

  @override
  State<TaskFormWidge> createState() => _TaskFormWidgeState();
}

class _TaskFormWidgeState extends State<TaskFormWidge> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskCubit, TaskState>(
      listener: buildBlocListener,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Titulo',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ),
              TextFormField(
                maxLines: 5,
                controller: descriptionController,
                maxLength: 500,
                decoration: const InputDecoration(
                  labelText: 'Descrição',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if (state is TaskLoadingState)
                const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              else
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 130, vertical: 10),
                    backgroundColor: const Color(0XFF038dff),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    await context.read<TaskCubit>().createTask(
                        isDone: "0",
                        title: titleController.text,
                        date: DateTime.now().toString(),
                        description: descriptionController.text);
                  },
                  child: const Text(
                    "Criar conta",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

buildBlocListener(BuildContext context, TaskState state) {
  if (state is TaskLoadedState) {
    if (state.value != 0) {
      Messages.showSuccess(context, "Tarefa criada com Sucesso");
      return AppRoutes.pushReplecement(
        context: context,
        page: const HomePage(),
      );
    }
  }
  if (state is TaskErrorState) {
    return Messages.showError(
      context,
      state.error,
    );
  }
}
