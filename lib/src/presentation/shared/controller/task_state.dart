part of 'task_cubit.dart';

@immutable
sealed class TaskState {}

final class TaskInitial extends TaskState {}

final class TaskLoadingState extends TaskState {}

final class TaskLoadedState extends TaskState {
  final int? value;
  final List<TaskEntitie?>? taskList;

  TaskLoadedState({
    this.value,
    this.taskList,
  });
}

class TaskErrorState extends TaskState {
  final String error;

  TaskErrorState({required this.error});
}
