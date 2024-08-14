import '../usecases/usecases.dart';

abstract interface class DetailsRepositoryI {
  Future<Either<Failure, TaskEntitie>> getTaskById({required String id});
  Future<Either<Failure, bool>> deleteTaskById({required String id});
  Future<Either<Failure, bool>> updateTaskById(
      {required String title, required String description, required String id});
}
