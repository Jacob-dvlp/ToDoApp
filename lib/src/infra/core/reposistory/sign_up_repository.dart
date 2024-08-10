import 'repository.dart';

class SignUpRepository implements SignUpRepositoryI {
  final ClientFirebase client;
  SignUpRepository({required this.client});

  @override
  Future<Either<Failure, UserModel>> userSignUp(
      {required String email, required String password}) async {
    try {
      final auth = await client.firebaseAuth.createUserWithEmailAndPassword(
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
