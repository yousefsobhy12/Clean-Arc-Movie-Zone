class SigninReqParams {
  final String email;
  final String password;

  SigninReqParams({required this.email, required this.password});

  Map<dynamic, dynamic> toMap() {
    return <dynamic, dynamic>{'email': email, 'password': password};
  }
}
