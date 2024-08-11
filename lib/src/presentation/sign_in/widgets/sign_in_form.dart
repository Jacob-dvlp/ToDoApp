import 'package:flutter_svg/svg.dart';
import 'package:todo_app/src/presentation/sign_in/controller/sign_in_cubit.dart';

import '../../../../app_exports.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/app_custom_message.dart';
import '../../home/widget/home_page.dart';
import '../../routes/app_routes.dart';
import '../../sign_up/widget/todo_text_field.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: buildBlocListener,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                AppConstants.logo,
                semanticsLabel: 'Logo',
              ),
              Column(children: [
                TodoTextField(
                  label: "E-mail",
                  controller: emailController,
                  labelTextStyle: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: const Color(0xff9D9AB4)),
                ),
                const SizedBox(height: 30),
                TodoTextField(
                  label: "Senha",
                  obscureText: true,
                  controller: passwordController,
                  labelTextStyle: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: const Color(0xff9D9AB4)),
                ),
                const SizedBox(height: 35),
                if (state is LoadingSignInState)
                  const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                else
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 160, vertical: 10),
                      backgroundColor: const Color(0XFF038dff),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      await context.read<SignInCubit>().signIn(
                          email: emailController.text,
                          password: passwordController.text);
                    },
                    child: const Text(
                      "Entrar",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                const SizedBox(
                  height: 20,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text("Não possuí uma conta? ",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      )),
                  GestureDetector(
                    onTap: () {
                      AppRoutes.pushReplecement(
                        context: context,
                        page: const SignUpPage(),
                      );
                    },
                    child: const Text(
                      "Criar conta",
                      style: TextStyle(
                        color: Color(0XFF038dff),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ])
              ]),
              const SizedBox.shrink()
            ],
          ),
        );
      },
    );
  }
}

buildBlocListener(BuildContext context, SignInState state) {
  if (state is LoadedSignInState) {
    if (state.userEntite.userUid!.isNotEmpty) {
      Messages.showSuccess(context, AppConstants.loginMessage);
      return AppRoutes.pushReplecement(
        context: context,
        page: const HomePage(),
      );
    }
  }
  if (state is ErrorSignInState) {
    return Messages.showError(
      context,
      state.error,
    );
  }
}
