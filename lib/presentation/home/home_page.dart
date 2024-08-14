import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/app_exports.dart';
import 'package:todo_app/presentation/widgets/custom_app_bar.dart';
import 'package:todo_app/src/services/locator.dart';

import '../../utils/app_theme.dart';
import '../createtask/task_form_widge.dart';
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
          key: const Key("createtask-page"),
          onPressed: () async {
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
          icon: const Icon(Icons.create),
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
                  key: Key("isEmptyList"),
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
