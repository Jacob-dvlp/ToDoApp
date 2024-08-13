import '../controller/controller.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final TaskUsecaseI taskUsecaseI;
  List<TaskEntitie?> filterTasks = [];

  TaskCubit({required this.taskUsecaseI}) : super(TaskInitial()) {
    getTaskList();
  }

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

  Future getTaskList({String? filter}) async {
    emit(TaskLoadingState());
    final response = await taskUsecaseI.getTaskList();
    if (filter == null) {
      return response.fold(
          (error) => emit(
                TaskErrorState(error: error.error!),
              ), (data) {
        filterTasks = data;
        emit(
          TaskLoadedState(taskList: data),
        );
      });
    } else {
      final data =
          filterTasks.where((task) => task!.isDone!.contains(filter)).toList();
      emit(
        TaskLoadedState(taskList: data),
      );
    }
  }

  Future deleteAllTasks() async {
    emit(TaskLoadingState());
    final response = await taskUsecaseI.deleteAllTasks();
    return response.fold(
        (error) => emit(
              TaskErrorState(error: error.error!),
            ), (delete) {
      emit(
        TaskLoadedState(delete: delete),
      );
    });
  }

  Future completetask({required int id, required String isDone}) async {
    emit(TaskLoadingState());
    final response = await taskUsecaseI.completetask(id: id, isDone: isDone);
    return response.fold(
        (error) => emit(
              TaskErrorState(error: error.error!),
            ), (delete) {
      emit(
        TaskLoadedState(delete: delete),
      );
    });
  }
}
