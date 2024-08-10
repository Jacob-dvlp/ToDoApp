
import "../demain/usecases/usecases.dart";
import "locator.dart";

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<ClientFirebase>(
    ClientFirebase(
      firebaseAuth: FirebaseAuth.instance,
    ),
  );
  locator.registerLazySingleton(
    () => SignUpCubit(
      signUpUsecaseI: locator.get(),
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

  locator.registerSingleton<SignInUsecaseI>(
    SignInUsecaseImp(
      signInRepositoryI: locator.get(),
    ),
  );

  locator.registerSingleton<SignUpRepositoryI>(
    SignUpRepository(
      client: locator.get(),
    ),
  );

  locator.registerSingleton<SignUpUsecaseI>(
    SignUpUsecaseImp(
      signUpRepositoryI: locator.get(),
    ),
  );
}
