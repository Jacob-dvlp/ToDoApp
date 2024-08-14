import 'package:flutter/gestures.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/app_exports.dart';
import 'package:todo_app/src/services/locator_service.dart';
import 'package:todo_app/presentation/details/controller/task_details_cubit.dart';
import 'package:todo_app/presentation/details/details.dart';
import 'package:todo_app/presentation/routes/app_routes.dart';

import '../../../utils/app_theme.dart';
import '../../shared/task/task_cubit.dart';

class CustomCardWidget extends StatelessWidget {
  final TaskLoadedState taskState;
  final SlidableController controller;

  const CustomCardWidget(
      {super.key, required this.taskState, required this.controller});

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      mainAxisMargin: 100,
      radius: const Radius.circular(10),
      thumbColor: Colors.grey,
      child: SlidableAutoCloseBehavior(
        child: GridView.builder(
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.0,
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 3,
          ),
          itemCount: taskState.taskList?.length,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            final task = taskState.taskList![index];
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  key: const Key("goTodetails"),
                  onTap: () async {
                    context
                        .read<TaskDetailsCubit>()
                        .getTaskById(id: task.id.toString());
                    AppRoutes.go(
                      context: context,
                      page: Details(
                        id: task.id.toString(),
                        taskIsCompleted: task.isDone == "0" ? false : true,
                      ),
                    );
                  },
                  child: task!.isDone == "0"
                      ? Slidable(
                          dragStartBehavior: DragStartBehavior.down,
                          key: const ValueKey(0),
                          startActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) async {
                                  await context
                                      .read<TaskCubit>()
                                      .completetask(id: task.id!, isDone: "1");
                                  locator.get<TaskCubit>().getTaskList();
                                  controller.openEndActionPane();
                                },
                                backgroundColor: primaryColor,
                                foregroundColor: Colors.white,
                                icon: Icons.check,
                                label: 'Feito',
                                autoClose: true,
                              ),
                            ],
                          ),
                          child: SizedBox(
                            height: 200,
                            child: Card(
                              elevation: 10,
                              child: SizedBox(
                                height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                                child: Text(
                                              task.title!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            )),
                                            CircleAvatar(
                                              maxRadius: 13,
                                              backgroundColor: primaryColor,
                                            )
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            task.description!,
                                            overflow: TextOverflow.fade,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Card(
                          elevation: 10,
                          child: SizedBox(
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                            child: Text(
                                          task.title!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        )),
                                        const CircleAvatar(
                                          maxRadius: 13,
                                          backgroundColor: Colors.green,
                                          child: Icon(Icons.check),
                                        )
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        task.description!,
                                        overflow: TextOverflow.fade,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                ));
          },
        ),
      ),
    );
  }
}
