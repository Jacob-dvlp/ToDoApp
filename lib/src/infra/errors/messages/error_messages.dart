class ErrorMessages {
  static const String weakPassword = "weak-password";
  static const String emailAlreadyInUse = "email-already-in-use";
  static const String invalidEmail = "invalid-email";
  static String? status;

  static String showMessage(String code) {
    if (code == weakPassword) {
      status = "A senha fornecida é muito fraca.";
    }
    if (code == emailAlreadyInUse) {
      status = "Este email está sendo usado";
    }
    if (code == invalidEmail) {
      status = "Email inválido";
    }
    return status!;
  }
}
