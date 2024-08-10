// ignore_for_file: use_build_context_synchronously, curly_braces_in_flow_control_structures

import 'package:flutter_svg/svg.dart';
import 'package:todo_app/app_exports.dart';

import '../../../utils/app_constants.dart';
import '../../../utils/app_custom_message.dart';
import '../../home/widget/home_page.dart';
import '../../routes/app_routes.dart';
import '../../sign_in/sign_in_page.dart';
import '../controller/sign_up_cubit.dart';
import 'todo_text_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
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
                if (state is LoadingSignUpState)
                  const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                else
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 140, vertical: 10),
                      backgroundColor: const Color(0XFF038dff),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      await context.read<SignUpCubit>().signUp(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                    },
                    child: const Text(
                      "Criar conta",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                const SizedBox(
                  height: 20,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text("Já possuí uma conta? ",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      )),
                  GestureDetector(
                    onTap: () {
                      AppRoutes.pushReplecement(context: context, page: const SignInPage());
                    },
                    child: const Text(
                      "Entrar",
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

buildBlocListener(BuildContext context, SignUpState state) {
  if (state is LoadedSignUpState) {
    if (state.userEntite.userUid!.isNotEmpty) {
      Messages.showSuccess(context, AppConstants.createAccount);
      return AppRoutes.pushReplecement(
        context: context,
        page: const HomePage(),
      );
    }
  }
  if (state is ErrorSignUpState) {
    return Messages.showError(
      context,
      state.error,
    );
  }
}
