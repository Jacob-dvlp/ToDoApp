import 'package:todo_app/app_exports.dart';
import 'package:todo_app/presentation/routes/app_routes.dart';
import 'package:todo_app/presentation/shared/user/user_cubit.dart';
import 'package:todo_app/presentation/sign_in/sign_in_page.dart';
import 'package:todo_app/src/services/locator.dart';

import '../../src/services/locator_service.dart';
import '../../utils/app_custom_message.dart';
import '../../utils/app_theme.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocConsumer<UserCubit, UserState>(
                  listener: buildBlocListener,
                  builder: (context, state) {
                    if (state is UserLoadedState) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 40),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () => showAlertDialogExitApp(context),
                                child: CircleAvatar(
                                    backgroundColor: primaryColor,
                                    child: Text(
                                      state.userEntite!.userEmail![0]
                                          .toUpperCase(),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    if (state is UserLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }
                    return GestureDetector(
                      onTap: () => showAlertDialogExitApp(context),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: primaryColor,
                          child: const Text("E"),
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0, top: 40),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      children: [
                        CircleAvatar(
                            backgroundColor: primaryColor,
                            child: GestureDetector(
                                onTap: () async {
                                  await context
                                      .read<TaskCubit>()
                                      .deleteAllTasks();
                                  await locator.get<TaskCubit>().getTaskList();
                                  return Messages.showSuccess(
                                    context,
                                    "Tarefas excluidas com successo",
                                  );
                                },
                                child: const Icon(Icons.delete))),
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
          'Filtrar tarefas',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        titlePadding: const EdgeInsets.only(left: 100, right: 100, top: 25),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(primaryColor)),
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
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Colors.green,
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
                style: ButtonStyle(
                    backgroundColor: const WidgetStatePropertyAll(
                      Colors.red,
                    ),
                    textStyle:
                        WidgetStatePropertyAll(TextStyle(color: primaryColor))),
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

Future<void> showAlertDialogExitApp(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Sair do Aplicativo',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        content: const Text("Tem a certeza ?"),
        actions: [
          TextButton(
            onPressed: () {
              AppRoutes.close(context: context);
            },
            child: Text(
              'Cancelar',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          TextButton(
            onPressed: () async {
              context.read<UserCubit>().logout();
              AppRoutes.close(context: context);
            },
            child: Text(
              'Sair',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        ],
      );
    },
  );
}

buildBlocListener(BuildContext context, UserState state) {
  if (state is UserLogoutState) {
    AppRoutes.pushReplecement(context: context, page: const SignInPage());
  }
  if (state is UserErrorState) {
    return Messages.showError(
      context,
      state.error,
    );
  }
}
