class SignupReqParams {
  final String email;
  final String password;

  SignupReqParams({required this.email, required this.password});

  Map<dynamic, dynamic> toMap() {
    return <dynamic, dynamic>{'email': email, 'password': password};
  }
}
