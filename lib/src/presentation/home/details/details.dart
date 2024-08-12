import 'package:todo_app/app_exports.dart';
import 'package:todo_app/src/infra/services/locator.dart';
import 'package:todo_app/src/presentation/home/home_page.dart';
import 'package:todo_app/src/presentation/routes/app_routes.dart';

import '../../../infra/services/locator_service.dart';
import '../../../utils/app_custom_message.dart';
import '../../../utils/app_theme.dart';
import '../../createtask/widgets/task_form_widge.dart';

class Details extends StatelessWidget {
  final String id;
  const Details({super.key, required this.id});

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
                        color: Colors.red,
                      ),
                    ),
                  ),
                )
              ],
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
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              state.taskEntitie!.title!,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              child: Text(
                                state.taskEntitie!.description!,
                                style: Theme.of(context).textTheme.bodyMedium,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        Text(state.taskEntitie!.date!)
                      ],
                    ),
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
