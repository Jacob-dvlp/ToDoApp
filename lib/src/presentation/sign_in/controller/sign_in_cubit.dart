import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/src/infra/demain/usecases/usecases.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInUsecaseI signInUsecaseI;
  SignInCubit({
    required this.signInUsecaseI,
  }) : super(SignInInitial());

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
      (data) {
        log(data.userUid!);

        return emit(
          LoadedSignInState(
            userEntite: data,
          ),
        );
      },
    );
  }
}
