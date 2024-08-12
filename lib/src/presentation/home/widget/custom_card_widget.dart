import 'package:todo_app/app_exports.dart';
import 'package:todo_app/src/presentation/home/details/controller/task_details_cubit.dart';
import 'package:todo_app/src/presentation/home/details/details.dart';
import 'package:todo_app/src/presentation/routes/app_routes.dart';

import '../../../utils/app_theme.dart';
import '../../shared/controller/task_cubit.dart';

class CustomCardWidget extends StatelessWidget {
  final TaskLoadedState taskState;
  const CustomCardWidget({super.key, required this.taskState});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
              onTap: () async {
                context
                    .read<TaskDetailsCubit>()
                    .getTaskById(id: task.id.toString());
                AppRoutes.go(
                  context: context,
                  page: Details(id: task.id.toString()),
                );
              },
              child: Card(
                elevation: 10,
                child: SizedBox(
                  height: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(task!.title!),
                            CircleAvatar(
                              backgroundColor: primaryColor,
                              child: const Icon(
                                Icons.bookmark_border,
                              ),
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
                            style: const TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
