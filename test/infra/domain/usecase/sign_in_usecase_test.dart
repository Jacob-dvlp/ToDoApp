import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/src/infra/core/reposistory/repository.dart';
import 'package:todo_app/src/infra/services/locator.dart';

import '../../../utils/mocks/mocks.mocks.dart';

void main() {
  late final SignInRepositoryI mocksignUpRepository;
  late final SignInUsecaseImp signInUsecaseI;
  String? email;
  String? password;
  UserEntite? userEntite;
  setUpAll(
    () async {
      mocksignUpRepository = MockSignInRepositoryI();
      signInUsecaseI =
          SignInUsecaseImp(signInRepositoryI: mocksignUpRepository);
      email = "lartes@gmail.com";
      password = "123123";

      userEntite = UserEntite(userEmail: email, userPassWord: password);
    },
  );

  group(
    "Sign-In usecase",
    () {
      test(
        "Sign-In User Success",
        () async {
          when(mocksignUpRepository.userSignIn(
                  email: email!, password: password!))
              .thenAnswer(
            (_) async => Right(userEntite!),
          );
          final result = await signInUsecaseI.userSignIn(
              email: email!, password: password!);

          expect(result, Right(userEntite));
        },
      );

      test(
        "Show error when fields are empty",
        () async {
          when(mocksignUpRepository.userSignIn(email: "", password: ""))
              .thenAnswer(
            (_) async => Left(Failure(error: ErrorMessages.status)),
          );
          final result =
              await signInUsecaseI.userSignIn(email: "", password: "");

          expect(result, Left(Failure(error: ErrorMessages.status)));
        },
      );
    },
  );
}
