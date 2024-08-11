import "../core/reposistory/task_repository.dart";
import "../demain/usecases/task_usecase_imp.dart";
import "../demain/usecases/usecases.dart";
import "locator.dart";

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<ClientFirebase>(
    ClientFirebase(
      firebaseAuth: FirebaseAuth.instance,
    ),
  );

  locator.registerSingleton<TaskDatabase>(TaskDatabase());

  locator.registerLazySingleton(
    () => SignUpCubit(
      signUpUsecaseI: locator.get(),
    ),
  );

  locator.registerLazySingleton(
    () => TaskCubit(
      taskUsecaseI: locator.get(),
    ),
  );

  locator.registerLazySingleton(
    () => SignInCubit(
      signInUsecaseI: locator.get(),
    ),
  );

  locator.registerSingleton<SignInRepositoryI>(
    SignInRepository(
      client: locator.get(),
    ),
  );

  locator.registerSingleton<SignUpRepositoryI>(
    SignUpRepository(
      client: locator.get(),
    ),
  );

  locator.registerSingleton<TaskRepositoryI>(
    TaskRepository(
      taskDatabase: locator.get(),
    ),
  );

  locator.registerSingleton<SignUpUsecaseI>(
    SignUpUsecaseImp(
      signUpRepositoryI: locator.get(),
    ),
  );

  locator.registerSingleton<SignInUsecaseI>(
    SignInUsecaseImp(
      signInRepositoryI: locator.get(),
    ),
  );

  locator.registerSingleton<TaskUsecaseI>(
    TaskUsecaseImp(
      taskRepositoryI: locator.get(),
    ),
  );
}
