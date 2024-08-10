import 'app_exports.dart';
import 'src/infra/services/locator_service.dart';
import 'src/presentation/sign_in/sign_in_page.dart';
import 'src/presentation/sign_up/controller/sign_up_cubit.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignUpCubit>(
          lazy: false,
          create: (context) => locator.get<SignUpCubit>(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignInPage(),
      ),
    );
  }
}
