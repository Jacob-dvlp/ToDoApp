part of 'task_details_cubit.dart';

@immutable
sealed class TaskDetailsState {}

final class TaskDetailsInitial extends TaskDetailsState {}

final class TaskDetailsLoading extends TaskDetailsState {}

final class TaskDetailsLoaded extends TaskDetailsState {
  final TaskEntitie? taskEntitie;
  final bool? success;
  TaskDetailsLoaded({this.taskEntitie, this.success});
}

final class TaskDetailsError extends TaskDetailsState {
  final String error;

  TaskDetailsError({required this.error});
}
