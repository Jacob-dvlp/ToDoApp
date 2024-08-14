import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/app_exports.dart';
import 'package:todo_app/presentation/sign_in/sign_in_page.dart';
import 'package:todo_app/src/services/locator.dart';
import 'package:todo_app/src/services/locator_service.dart';

void main() {
  setUpAll(() async {
    setupFirebaseCoreMocks();
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    setupLocator();
  });
  group(
    "Sign-In Test",
    () {
      testWidgets(
        "It should return an error message stating that empty fields are not allowed",
        (widgetTester) async {
          WidgetsFlutterBinding.ensureInitialized();
          await widgetTester.pumpWidget(
            BlocProvider<SignInCubit>(
              create: (context) => locator.get<SignInCubit>(),
              child: const MaterialApp(
                home: SignInPage(),
              ),
            ),
          );

          final buttom = find.byKey(const Key("elevatedButton-login"));

          await widgetTester.tap(buttom);

          await widgetTester.pumpAndSettle();

          expect(find.text("Campos vazios não são permetidos"), findsOneWidget);
        },
      );

      testWidgets(
        "It should return a warning stating that the password provided is too weak.",
        (widgetTester) async {
          WidgetsFlutterBinding.ensureInitialized();
          await widgetTester.pumpWidget(
            BlocProvider<SignInCubit>(
              create: (context) => locator.get<SignInCubit>(),
              child: const MaterialApp(
                home: SignInPage(),
              ),
            ),
          );

          final email = find.byKey(const Key("email-field"));
          await widgetTester.tap(email);
          final password = find.byKey(const Key("password-field"));
          await widgetTester.tap(password);

          await widgetTester.enterText(email, "admin@gmail.com");
          await widgetTester.tap(email);

          await widgetTester.pumpAndSettle();

          await widgetTester.enterText(password, "");
          await widgetTester.pumpAndSettle();

          final buttom = find.byKey(const Key("elevatedButton-login"));
          await widgetTester.tap(buttom);
          await widgetTester.pumpAndSettle();

          expect(find.text("Email inválido ou senha"), findsNothing);
        },
      );
    },
  );
}
