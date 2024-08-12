import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/app_exports.dart';
import 'package:todo_app/src/infra/services/locator.dart';
import 'package:todo_app/src/presentation/widgets/custom_app_bar.dart';

import '../../infra/services/locator_service.dart';
import '../../utils/app_custom_message.dart';
import '../../utils/app_theme.dart';
import 'widget/custom_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final controller = SlidableController(this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      floatingActionButton: CircleAvatar(
        backgroundColor: primaryColor,
        child: IconButton(
          onPressed: () async {
            await context.read<TaskCubit>().deleteAllTasks();
            await locator.get<TaskCubit>().getTaskList();
            return Messages.showSuccess(
                context, "Tarefas excluidas com successo");
          },
          icon: const Icon(Icons.delete),
        ),
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
                child: Text(
                  "Lista vazia",
                ),
              );
            }
            return CustomCardWidget(
              taskState: state,
              controller: controller,
            );
          }
          return Container();
        },
      ),
    );
  }
}
