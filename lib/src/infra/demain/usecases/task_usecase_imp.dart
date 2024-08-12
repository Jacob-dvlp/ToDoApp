import 'usecases.dart';

class TaskUsecaseImp implements TaskUsecaseI {
  final TaskRepositoryI taskRepositoryI;

  TaskUsecaseImp({required this.taskRepositoryI});

  @override
  Future<Either<Failure, int>> createTask({
    required String isDone,
    required String title,
    required String date,
    required String description,
  }) async {
    final response = await taskRepositoryI.createTask(
        isDone: isDone, title: title, date: date, description: description);

    return response.fold(
      (error) => Left(
        Failure(
          error: ErrorMessages.showMessage(error.error!),
        ),
      ),
      (data) => Right(data),
    );
  }

  @override
  Future<Either<Failure, List<TaskEntitie?>>> getTaskList() async {
    final response = await taskRepositoryI.getTaskList();

    return response.fold(
      (error) => Left(
        Failure(
          error: ErrorMessages.showMessage(
            error.error!,
          ),
        ),
      ),
      (data) => Right(data),
    );
  }

  @override
  Future<Either<Failure, bool>> deleteAllTasks() async {
    final response = await taskRepositoryI.deleteAllTasks();

    return response.fold(
      (error) => Left(
        Failure(
          error: ErrorMessages.showMessage(
            error.error!,
          ),
        ),
      ),
      (data) => Right(data),
    );
  }

  @override
  Future<Either<Failure, bool>> completetask(
      {required int id, required String isDone}) async {
    final response =
        await taskRepositoryI.completetask(id: id, isDone: isDone);

    return response.fold(
      (error) => Left(
        Failure(
          error: ErrorMessages.showMessage(
            error.error!,
          ),
        ),
      ),
      (data) => const Right(true),
    );
  }
}
