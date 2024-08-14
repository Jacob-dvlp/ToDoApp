import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/src/core/reposistory/repository.dart';
import 'package:todo_app/src/demain/usecases/usecases.dart';

part 'task_details_state.dart';

class TaskDetailsCubit extends Cubit<TaskDetailsState> {
  final DetailsUsecaseI detailsUsecaseI;
  TaskDetailsCubit({required this.detailsUsecaseI})
      : super(TaskDetailsInitial());

  Future getTaskById({required String id}) async {
    emit(TaskDetailsLoading());
    final response = await detailsUsecaseI.getTaskById(id: id);
    return response.fold(
      (error) => emit(
        TaskDetailsError(error: error.error!),
      ),
      (data) {
        emit(
          TaskDetailsLoaded(taskEntitie: data),
        );
      },
    );
  }

  Future deleteTaskById({required String id}) async {
    return await detailsUsecaseI.deleteTaskById(id: id);
  }

  Future updateTaskById({required TaskEntitie task}) async {
    final response = await detailsUsecaseI.updateTaskById(
      title: task.title!,
      description: task.description!,
      id: task.id.toString(),
    );
    return response.fold(
      (error) => emit(
        TaskDetailsError(error: error.error!),
      ),
      (r) => emit(
        TaskDetailsLoaded(success: r),
      ),
    );
  }
}
