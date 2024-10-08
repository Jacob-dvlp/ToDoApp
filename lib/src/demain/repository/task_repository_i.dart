import '../usecases/usecases.dart';

abstract interface class TaskRepositoryI {
  Future<Either<Failure, int>> createTask(
      {required String isDone,
      required String title,
      required String date,
      required String description});
  Future<Either<Failure, bool>> completetask(
      {required int id, required String isDone});
  Future<Either<Failure, List<TaskEntitie?>>> getTaskList();
  
  Future<Either<Failure, bool>> deleteAllTasks();
}
