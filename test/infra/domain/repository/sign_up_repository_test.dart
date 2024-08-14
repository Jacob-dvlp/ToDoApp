// import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
// import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:todo_app/src/infra/core/reposistory/repository.dart';
// import 'package:todo_app/src/infra/services/locator.dart';

// import '../../../../utils/mocks/mocks.mocks.dart';

// class MockFirebaseAuth extends Mock implements FirebaseAuth {
//   @override
//   Future<UserCredential> signInWithEmailAndPassword({
//     required String? email,
//     required String? password,
//   }) =>
//       super.noSuchMethod(
//           Invocation.method(#signInWithEmailAndPassword, [email, password]),
//           returnValue: Future.value(MockUserCredential()));
// }

// void main() {
//   late SignUpRepository signUpRepositoryI;
//   late MockFirebaseAuth mockFirebaseAuth;
//   late MockUserCredential mockCredential;
//   late MockUser mockUser;

//   setUp(
//     () async {
//       TestWidgetsFlutterBinding.ensureInitialized();
//       setupFirebaseCoreMocks();
//       mockFirebaseAuth = MockFirebaseAuth();
//       mockCredential = MockUserCredential();
//       mockUser = MockUser();

//       signUpRepositoryI = SignUpRepository(
//         client: ClientFirebase(firebaseAuth: mockFirebaseAuth),
//       );
//       when(mockCredential.user).thenReturn(mockUser); // IMPORTANT
//     },
//   );

//   group(
//     "Sign-Up Repository",
//     () {
//       test(
//           "When valid password and emails are provided Should return a user details",
//           () async {
//         UserModel userModel =
//             const UserModel(userEmailModel: "", userUidModel: "");

//         when(mockFirebaseAuth.signInWithEmailAndPassword(
//                 email: any, password: any))
//             .thenAnswer((_) async => mockCredential);

//         final result =
//             await signUpRepositoryI.userSignUp(email: "", password: "");
//         expect(result, Right(userModel));
//       });
//     },
//   );
// }

// // Fake implementation of UserCredential for mocking
// class FakeUserCredential extends Fake implements UserCredential {
//   @override
//   User get user => FakeUser();
// }

// // Fake implementation of User for mocking
// class FakeUser extends Fake implements User {
//   @override
//   String get uid => 'fakeUid';

//   @override
//   String get email => 'fake@example.com';

//   @override
//   String? get displayName => 'Fake User';
// }

import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Test", () {});
}
