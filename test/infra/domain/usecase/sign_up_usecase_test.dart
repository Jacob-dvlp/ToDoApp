import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/src/core/reposistory/repository.dart';
import 'package:todo_app/src/services/locator.dart';

import '../../../utils/mocks/mocks.mocks.dart';

void main() {
  late final SignUpRepositoryI mocksignUpRepository;
  late final SignUpUsecaseImp signUpUsecaseI;
  String? email;
  String? password;
  UserEntite? userEntite;
  setUpAll(
    () {
      mocksignUpRepository = MockSignUpRepositoryI();
      signUpUsecaseI =
          SignUpUsecaseImp(signUpRepositoryI: mocksignUpRepository);
      email = "lartes@gmail.com";
      password = "123123";

      userEntite = UserEntite(userEmail: email, userPassWord: password);
    },
  );

  test(
    "must return an entity if it is successful",
    () async {
      when(mocksignUpRepository.userSignUp(email: email!, password: password!))
          .thenAnswer(
        (_) async => Right(userEntite!),
      );
      final result =
          await signUpUsecaseI.userSignUp(email: email!, password: password!);

      expect(result, Right(userEntite));
    },
  );

  test(
    "should return an error if no data is passed",
    () async {
      when(mocksignUpRepository.userSignUp(email: "", password: "")).thenAnswer(
        (_) async => Left(Failure(error: ErrorMessages.status)),
      );
      final result = await signUpUsecaseI.userSignUp(email: "", password: "");

      expect(result, Left(Failure(error: ErrorMessages.status)));
    },
  );
}
