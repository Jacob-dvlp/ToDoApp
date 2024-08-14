class ErrorMessages {
  static const String weakPassword = "weak-password";
  static const String emailAlreadyInUse = "email-already-in-use";
  static const String invalidEmail = "invalid-email";
  static const String userNotFound = "user-not-found";
  static const String userDisabled = "user-disabled";
  static const String operationNotAllowed = "operation-not-allowed";
  static const String invalidCredential = "invalid-credential";
  static const String networkRequestFailed = "network-request-failed";
  static String? status = "Erro no servidor ou problema com a conexão";
  static String? emptyFields = "Campos vazios";

  static String showMessage(String code) {
    if (code == weakPassword) {
      status = "A senha fornecida é muito fraca.";
    }
    if (code == emailAlreadyInUse) {
      status = "Este email está sendo usado";
    }
    if (code == invalidEmail || code == invalidCredential) {
      status = "Email inválido ou senha";
    }
    if (code == userNotFound) {
      status = "Usuário não encontrado";
    }
    if (code == userDisabled || code == operationNotAllowed) {
      status = "Essa conta não está ativa";
    }
    if (code == networkRequestFailed) {
      status = "Problema com a conexão";
    }
    return status!;
  }
}
