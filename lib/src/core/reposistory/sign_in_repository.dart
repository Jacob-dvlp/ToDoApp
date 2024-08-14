import 'repository.dart';

class SignInRepository implements SignInRepositoryI {
  final ClientFirebase client;

  SignInRepository({required this.client});

  @override
  Future<Either<Failure, UserModel>> userSignIn(
      {required String email, required String password}) async {
    try {
      final auth = await client.firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return Right(
        UserModel(
          userEmailModel: auth.user!.email,
          userUidModel: auth.user!.uid,
        ),
      );
    } on FirebaseAuthException catch (e) {
      return Left(Failure(error: ErrorMessages.showMessage(e.code)));
    }
  }
}
