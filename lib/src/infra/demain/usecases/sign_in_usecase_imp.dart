
import 'usecases.dart';

class SignInUsecaseImp implements SignInUsecaseI {
  final SignInRepositoryI signInRepositoryI;

  SignInUsecaseImp({required this.signInRepositoryI});

  @override
  Future<Either<Failure, UserEntite>> userSignIn(
      {required String email, required String password}) async {
    final response = await signInRepositoryI.userSignIn(
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
