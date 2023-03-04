abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoginLoadingState extends AuthState {}

class AuthLoginSuccessState extends AuthState {}

class AuthLoginErrorState extends AuthState {
  final String error;
  AuthLoginErrorState(this.error);
}

class AuthRegisterLoadingState extends AuthState {}

class AuthRegisterSuccessState extends AuthState {}

class AuthRegisterErrorState extends AuthState {
  final String error;
  AuthRegisterErrorState(this.error);
}

class AuthSignOutSuccessState extends AuthState {}

class AuthSignOutErrorState extends AuthState {
  final String error;
  AuthSignOutErrorState(this.error);
}
