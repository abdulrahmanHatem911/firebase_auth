import 'package:firebase_app_auth/controller/cubit/auth/auth_cubit.dart';
import 'package:firebase_app_auth/controller/cubit/auth/auth_state.dart';
import 'package:firebase_app_auth/modules/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSignOutSuccessState) {
          Fluttertoast.showToast(
            msg: 'Success Sign Out 🚀',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => SignInScreen(),
            ),
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        AuthCubit cubit = AuthCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Layout Screen'),
            leading: const Icon(Icons.menu),
            actions: [
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () => cubit.signOut(),
              ),
            ],
          ),
          body: const Center(
            child: Text('Layout Screen'),
          ),
        );
      },
    );
  }
}
