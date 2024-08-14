import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/src/demain/usecases/usecases.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInUsecaseI signInUsecaseI;
  final UserLocalUsecaseI userLocalUsecaseI;
  SignInCubit({required this.signInUsecaseI, required this.userLocalUsecaseI})
      : super(SignInInitial());

  Future signIn({required String email, required String password}) async {
    emit(
      LoadingSignInState(),
    );
    final response =
        await signInUsecaseI.userSignIn(email: email, password: password);
    return response.fold(
      (error) {
        return emit(
          ErrorSignInState(
            error: error.error!,
          ),
        );
      },
      (data) async {
        final userEntite =
            UserEntite(userEmail: data.userEmail, userUid: data.userUid);
        await userLocalUsecaseI.createUserInLocalStorege(
            userEntite: userEntite);

        return emit(
          LoadedSignInState(
            userEntite: data,
          ),
        );
      },
    );
  }
}
