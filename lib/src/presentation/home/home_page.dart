import 'package:todo_app/app_exports.dart';
import 'package:todo_app/src/infra/services/locator.dart';
import 'package:todo_app/src/presentation/widgets/custom_app_bar.dart';

import '../../utils/app_theme.dart';
import '../createtask/widgets/task_form_widge.dart';
import 'widget/custom_card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(),
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
                          height: 700,
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
              return CustomCardWidget(taskState: state);
            }
            return Container();
          },
        ));
  }
}
