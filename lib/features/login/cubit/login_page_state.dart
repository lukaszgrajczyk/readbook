part of 'login_page_cubit.dart';

@immutable
class LoginPageState {
  final String email;
  final String password;
  final String? errorMessage;

  const LoginPageState(
      {required this.email,
      required this.password,
      required this.errorMessage});
}
