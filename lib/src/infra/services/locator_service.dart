import "../../presentation/sign_up/controller/sign_up_cubit.dart";
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
      userLoginUsecaseI: locator.get(),
    ),
  );

  locator.registerSingleton<SignUpRepositoryI>(
    SignUpRepository(
      client: locator.get(),
    ),
  );

  locator.registerSingleton<UserLoginUsecaseI>(
    SignUpUsecaseImp(
      signUpRepositoryI: locator.get(),
    ),
  );
}
