// ignore_for_file: use_build_context_synchronously

import 'package:todo_app/app_exports.dart';
import 'package:todo_app/src/infra/services/locator.dart';
import 'package:todo_app/src/infra/services/locator_service.dart';
import 'package:todo_app/presentation/home/home_page.dart';
import 'package:todo_app/src/utils/app_theme.dart';

import '../../src/infra/demain/entities/task_entitie.dart';
import '../../src/utils/app_custom_message.dart';
import '../routes/app_routes.dart';
import '../widgets/custom_text_form_field.dart';

class TaskFormWidge extends StatefulWidget {
  final bool isEditeTask;
  final TaskEntitie? entitie;
  const TaskFormWidge({super.key, this.isEditeTask = false, this.entitie});

  @override
  State<TaskFormWidge> createState() => _TaskFormWidgeState();
}

class _TaskFormWidgeState extends State<TaskFormWidge> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  @override
  void initState() {
    descriptionController.text = widget.entitie?.description ?? "";
    titleController.text = widget.entitie?.title ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => AppRoutes.close(context: context),
                    child: CircleAvatar(
                      backgroundColor: primaryColor,
                      child: const Icon(Icons.close),
                    ),
                  )),
              Text(
                widget.isEditeTask ? "Atualizar a tarefa" : "Criar uma tarefa",
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                key: const Key("title"),
                labelText: 'Titulo',
                textEditingController: titleController,
              ),
              CustomTextFormField(
                key: const Key("description"),
                labelText: 'Descrição',
                textEditingController: descriptionController,
              ),
              const SizedBox(
                height: 20,
              ),
              if (state is TaskLoadingState)
                const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              else
                widget.isEditeTask
                    ? ElevatedButton(
                        key: const Key("updateTaskButton"),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 130, vertical: 10),
                          backgroundColor: primaryColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(6),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          if (titleController.text.isEmpty ||
                              descriptionController.text.isEmpty) {
                            return Messages.showError(
                                context, "Campos vazios não são permetidos");
                          } else {
                            await context
                                .read<TaskDetailsCubit>()
                                .updateTaskById(
                                  task: TaskEntitie(
                                      title: titleController.text,
                                      description: descriptionController.text,
                                      id: widget.entitie!.id),
                                );
                            Messages.showSuccess(
                                context, "Tarefa atualizada com Sucesso");
                            locator<TaskCubit>().getTaskList();
                            await locator<TaskDetailsCubit>()
                                .getTaskById(id: widget.entitie!.id.toString());
                            return AppRoutes.close(context: context);
                          }
                        },
                        child: const Text(
                          "Atualizar",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      )
                    : ElevatedButton(
                        key: const Key("elevateButtonSaveTask"),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 130, vertical: 10),
                          backgroundColor: primaryColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(6),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          if (titleController.text.isEmpty ||
                              descriptionController.text.isEmpty) {
                            return Messages.showError(
                                context, "Campos vazios não são permetidos");
                          } else {
                            await context.read<TaskCubit>().createTask(
                                isDone: "0",
                                title: titleController.text,
                                date: DateTime.now().toString(),
                                description: descriptionController.text);
                            Messages.showSuccess(
                                context, "Tarefa criada com Sucesso");
                            locator<TaskCubit>().getTaskList();
                            return AppRoutes.go(
                                context: context, page: const HomePage());
                          }
                        },
                        child: const Text(
                          "Criar",
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

buildBlocListener(BuildContext context, TaskState state) async {
  if (state is TaskLoadedState) {
    if (state.value != 0) {}
  }
  if (state is TaskErrorState) {
    return Messages.showError(
      context,
      state.error,
    );
  }
}
