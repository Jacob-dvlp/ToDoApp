import "usecases.dart";

class SignUpUsecaseImp implements SignUpUsecaseI {
  final SignUpRepositoryI signUpRepositoryI;

  SignUpUsecaseImp({required this.signUpRepositoryI});

  @override
  Future<Either<Failure, UserEntite>> userSignUp(
      {required String email, required String password}) async {
    final response = await signUpRepositoryI.userSignUp(
      email: email,
      password: password,
    );

    return response.fold(
      (error) {
        return Left(Failure(error: ErrorMessages.showMessage(error.error!)));
      },
      (data) => Right(
        data,
      ),
    );
  }
}
