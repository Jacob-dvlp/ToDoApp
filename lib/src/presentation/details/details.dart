import 'package:todo_app/app_exports.dart';
import 'package:todo_app/src/infra/services/locator.dart';
import 'package:todo_app/src/presentation/home/home_page.dart';
import 'package:todo_app/src/presentation/routes/app_routes.dart';

import '../../infra/services/locator_service.dart';
import '../../utils/app_custom_message.dart';
import '../../utils/app_theme.dart';
import '../createtask/task_form_widge.dart';
import 'widgets/custom_details_widget.dart';

class Details extends StatelessWidget {
  final String id;
  final bool taskIsCompleted;
  const Details({
    super.key,
    required this.id,
    this.taskIsCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskDetailsCubit, TaskDetailsState>(
      builder: (context, state) {
        if (state is TaskDetailsLoaded) {
          return Scaffold(
            appBar: AppBar(
              
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () async {
                      context.read<TaskDetailsCubit>().deleteTaskById(id: id);
                      Messages.showInfo(context, "Tarefa excluida com Sucesso");
                      locator<TaskCubit>().getTaskList();
                      return AppRoutes.pushReplecement(
                          context: context, page: const HomePage());
                    },
                    child: CircleAvatar(
                      backgroundColor: primaryColor,
                      child: const Icon(
                        Icons.delete,
                      ),
                    ),
                  ),
                )
              ],
            ),
            floatingActionButton: CircleAvatar(
              backgroundColor: primaryColor,
              child: IconButton(
                key: const Key("updateTask"),
                onPressed: () {
                  Navigator.push(
                    context,
                    ModalBottomSheetRoute(
                        builder: (context) {
                          return SizedBox(
                            height: 800,
                            child: TaskFormWidge(
                                isEditeTask: true, entitie: state.taskEntitie),
                          );
                        },
                        isScrollControlled: true),
                  );
                },
                icon: const Icon(Icons.edit),
              ),
            ),
            body: BlocBuilder<TaskDetailsCubit, TaskDetailsState>(
              builder: (context, state) {
                if (state is TaskDetailsLoading) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                if (state is TaskDetailsLoaded) {
                  return CustomDetailsWidget(
                    state: state,
                    taskIsCompleted: true,
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
