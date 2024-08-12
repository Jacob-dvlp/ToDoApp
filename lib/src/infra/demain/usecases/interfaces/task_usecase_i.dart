import '../usecases.dart';

abstract interface class TaskUsecaseI {
  Future<Either<Failure, int>> createTask(
      {required String isDone,
      required String title,
      required String date,
      required String description});

  Future<Either<Failure, List<TaskEntitie?>>> getTaskList();

  Future<Either<Failure, bool>> deleteAllTasks();
}
