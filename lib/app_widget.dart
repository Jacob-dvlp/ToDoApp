import 'package:todo_app/src/infra/services/locator.dart';
import 'package:todo_app/src/presentation/home/home_page.dart';

import 'app_exports.dart';
import 'src/infra/services/locator_service.dart';

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
        BlocProvider<SignInCubit>(
          lazy: false,
          create: (context) => locator.get<SignInCubit>(),
        ),
        BlocProvider<TaskCubit>(
          lazy: false,
          create: (context) => locator.get<TaskCubit>(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
