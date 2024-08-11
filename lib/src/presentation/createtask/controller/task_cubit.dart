import 'controller.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final TaskUsecaseI taskUsecaseI;
  TaskCubit({required this.taskUsecaseI}) : super(TaskInitial());

  Future createTask({
    required String isDone,
    required String title,
    required String date,
    required String description,
  }) async {
    emit(TaskLoadingState());

    final response = await taskUsecaseI.createTask(
      isDone: isDone,
      title: title,
      date: date,
      description: description,
    );

    return response.fold(
      (error) => emit(
        TaskErrorState(error: error.error!),
      ),
      (data) => emit(
        TaskLoadedState(value: data),
      ),
    );
  }
}
