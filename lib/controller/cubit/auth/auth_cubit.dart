import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);

  //
  Future<void> userLogin(
      {required String email, required String password}) async {
    emit(AuthLoginLoadingState());
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print('Success Login🚀');
      emit(AuthLoginSuccessState());
    }).catchError((error) {
      emit(AuthLoginErrorState(error.toString()));
    });
  }

  Future<void> registerUser(
      {required String email, required String password}) async {
    emit(AuthRegisterLoadingState());
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print('Success Register🚀');
      emit(AuthRegisterSuccessState());
    }).catchError((error) {
      emit(AuthRegisterErrorState(error.toString()));
    });
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut().then((value) {
      emit(AuthSignOutSuccessState());
    }).catchError((error) {
      emit(AuthSignOutErrorState(error.toString()));
    });
  }
}
