import 'usecases.dart';

class DetailsUsecaseImp implements DetailsUsecaseI {
  final DetailsRepositoryI detailsRepositoryI;

  DetailsUsecaseImp({required this.detailsRepositoryI});
  @override
  Future<Either<Failure, TaskEntitie>> getTaskById({required String id}) async {
    final response = await detailsRepositoryI.getTaskById(id: id);

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
  Future<Either<Failure, bool>> deleteTaskById({required String id}) async {
    final response = await detailsRepositoryI.deleteTaskById(id: id);

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
  Future<Either<Failure, bool>> updateTaskById(
      {required String title,
      required String description,
      required String id}) async {
    final response = await detailsRepositoryI.updateTaskById(
        title: title, description: description, id: id);

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
}
