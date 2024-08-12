import 'package:todo_app/app_exports.dart';
import 'package:todo_app/src/infra/services/locator.dart';
import 'package:todo_app/src/presentation/routes/app_routes.dart';

import '../../utils/app_theme.dart';
import '../createtask/widgets/task_form_widge.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        border: Border(
          bottom: BorderSide(color: primaryColor),
        ),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 40),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      children: [
                        CircleAvatar(
                            backgroundColor: primaryColor,
                            child: const Text("J")),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    Navigator.push(
                      context,
                      ModalBottomSheetRoute(
                          builder: (context) {
                            return const SizedBox(
                              height: 800,
                              child: TaskFormWidge(),
                            );
                          },
                          isScrollControlled: true),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0, top: 40),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: primaryColor,
                            child: const Icon(
                              Icons.create,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () => showAlertDialog(context),
                            child: CircleAvatar(
                              backgroundColor: primaryColor,
                              child: const Icon(
                                Icons.filter_alt,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(0, 140);
}

Future<void> showAlertDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Filtrar tarefa',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.green)),
                onPressed: () {
                  context.read<TaskCubit>().getTaskList(filter: "0");
                  AppRoutes.close(context: context);
                },
                child: Text(
                  'Não concluído',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    primaryColor,
                  ),
                ),
                onPressed: () {
                  context.read<TaskCubit>().getTaskList(filter: "1");
                  AppRoutes.close(context: context);
                },
                child: Text(
                  'Concluído',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: TextButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Colors.red,
                  ),
                ),
                onPressed: () {
                  context.read<TaskCubit>().getTaskList();
                  AppRoutes.close(context: context);
                },
                child: Text(
                  'Todas',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ),
          ],
        ),
        actions: const [],
      );
    },
  );
}
