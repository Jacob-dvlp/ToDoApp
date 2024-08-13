import 'package:flutter/material.dart';

import 'widget/sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignUpForm(),
    );
  }
}
