import 'dart:developer';

import 'controller.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUsecaseI signUpUsecaseI;
  final UserLocalUsecaseI userLocalUsecaseI;

  ReponseEntitie? reponseEntitie;

  SignUpCubit({required this.signUpUsecaseI, required this.userLocalUsecaseI})
      : super(InitialSignUpState());

  Future signUp({required String email, required String password}) async {
    emit(
      LoadingSignUpState(),
    );
    final response =
        await signUpUsecaseI.userSignUp(email: email, password: password);
    return response.fold(
      (error) {
        return emit(
          ErrorSignUpState(
            error: error.error!,
          ),
        );
      },
      (data) async {
        log(data.userUid!);
        final userEntite =
            UserEntite(userEmail: data.userEmail, userUid: data.userUid);
        await userLocalUsecaseI.createUserInLocalStorege(
            userEntite: userEntite);
        return emit(
          LoadedSignUpState(
            userEntite: data,
          ),
        );
      },
    );
  }
}
