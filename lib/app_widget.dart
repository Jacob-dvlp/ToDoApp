import 'package:todo_app/src/infra/services/locator.dart';
import 'package:todo_app/src/presentation/sign_in/sign_in_page.dart';

import 'app_exports.dart';
import 'src/infra/services/locator_service.dart';
import 'src/presentation/shared/user/user_cubit.dart';
import 'src/utils/app_theme.dart';

class AppWidget extends StatelessWidget {
  final bool accessToken;
  const AppWidget({super.key, required this.accessToken});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      key: const Key("bloc"),
      providers: [
        BlocProvider<SignUpCubit>(
          create: (context) => locator.get<SignUpCubit>(),
        ),
        BlocProvider<SignInCubit>(
          create: (context) => locator.get<SignInCubit>(),
        ),
        BlocProvider<TaskCubit>(
          create: (context) => locator.get<TaskCubit>(),
        ),
        BlocProvider<TaskDetailsCubit>(
          create: (context) => locator.get<TaskDetailsCubit>(),
        ),
        BlocProvider<UserCubit>(
          create: (context) => locator.get<UserCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: darkTheme(context),
        home: const SignInPage(),
      ),
    );
  }
}
