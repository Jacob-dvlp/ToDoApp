import 'dart:developer';

import 'controller.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final UserLoginUsecaseI userLoginUsecaseI;

  ReponseEntitie? reponseEntitie;

  SignUpCubit({
    required this.userLoginUsecaseI,
  }) : super(InitialSignUpState());

  Future signUp({required String email, required String password}) async {
    emit(
      LoadingSignUpState(),
    );
    final response =
        await userLoginUsecaseI.userSignUp(email: email, password: password);
    return response.fold(
      (error) {
        return emit(
          ErrorSignUpState(
            error: error.error!,
          ),
        );
      },
      (data) {
        log(data.userUid!);

        return emit(
          LoadedSignUpState(
            userEntite: data,
          ),
        );
      },
    );
  }
}
