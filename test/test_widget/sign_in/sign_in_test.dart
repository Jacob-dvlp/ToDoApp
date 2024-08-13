import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/app_exports.dart';
import 'package:todo_app/src/infra/services/locator.dart';
import 'package:todo_app/src/infra/services/locator_service.dart';
import 'package:todo_app/src/presentation/sign_in/sign_in_page.dart';

Future<void> main() async {
  Finder logo = find.byKey(const Key("logo"));
  Finder emailField = find.byKey(const Key("email-field"));
  Finder passwordField = find.byKey(const Key("password-field"));
  Finder signInButton = find.byKey(const Key("Text-entrar"));

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    setupLocator();
  });

  final bloc = MultiBlocProvider(
    providers: [
      BlocProvider<SignUpCubit>(
        create: (context) => locator.get<SignUpCubit>(),
      ),
    ],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInPage(),
    ),
  );

  testWidgets("Sign-In Page", (WidgetTester test) async {
    await test.pumpWidget(bloc);
    expect(logo, findsOneWidget);
    expect(emailField, findsOneWidget);
    expect(passwordField, findsOneWidget);
    expect(signInButton, findsOneWidget);
  });
}
