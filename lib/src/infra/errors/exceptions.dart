import 'package:todo_app/src/infra/client/firebase/firebase.dart';

class ExceptionCustom extends FirebaseAuthException {
  ExceptionCustom({required super.code});
}
