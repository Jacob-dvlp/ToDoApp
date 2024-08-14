import 'package:mockito/annotations.dart';
import 'package:todo_app/src/infra/services/locator.dart';

@GenerateMocks([
  ClientFirebase,
  SignInRepository,
  SignUpRepositoryI,
  SignUpUsecaseImp,
  SignInRepositoryI,
  SignInUsecaseImp,
  TaskUsecaseImp,
  UserCredential,
  TaskRepositoryI,
  DetailsUsecaseImp,
  DetailsRepositoryI,
])
void main() {}
