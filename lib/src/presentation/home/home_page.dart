import 'package:todo_app/app_exports.dart';
import 'package:todo_app/src/infra/services/locator.dart';
import 'package:todo_app/src/infra/services/locator_service.dart';

import '../../utils/app_custom_message.dart';
import '../../utils/app_theme.dart';
import '../createtask/widgets/task_form_widge.dart';
import 'widget/custom_card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Minhas Tarefas"),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () async {
              await context.read<TaskCubit>().deleteAllTasks();
              await locator.get<TaskCubit>().getTaskList();
              return Messages.showSuccess(
                  context, "Tarefas excluidas com successo");
            },
            child: CircleAvatar(
              backgroundColor: primaryColor,
              child: const Icon(
                Icons.delete_outline,
              ),
            ),
          )
        ],
      ),
      drawer: const Drawer(),
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
                        height: 800,
                        child: TaskFormWidge(),
                      );
                    },
                    isScrollControlled: true),
              );
            },
            icon: const Icon(Icons.edit)),
      ),
      body: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          if (state is TaskLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is TaskLoadedState) {
            if (state.taskList!.isEmpty) {
              return const Center(
                child: Text("Lista vazia"),
              );
            }
            return CustomCardWidget(taskState: state);
          }
          return Container();
        },
      ),
    );
  }
}
