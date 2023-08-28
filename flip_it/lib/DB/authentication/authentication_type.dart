enum AuthenticationType {
  signUp(true, true),
  emailSignIn(true, true),
  updateEmail(true, false),
  updatePassword(false, true),
  resetPassword(false, true);

  final bool isEmail;
  final bool isPassword;
  const AuthenticationType(this.isEmail, this.isPassword);
}

enum SignInProviderState {
  emailVerify,
  emailUnVerify,
  empty;
}
