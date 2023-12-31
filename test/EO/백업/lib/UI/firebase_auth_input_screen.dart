import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flip_it/DB/authentication/authentication_type.dart';
import 'package:flip_it/DB/authentication/firebase_auth_event.dart';
import 'package:flip_it/DB/authentication/firebase_auth_state.dart';
import 'package:flip_it/DB/authentication/firebase_auth_bloc.dart';

class FirebaseAuthInPutScreen extends StatelessWidget {
  final AuthenticationType type;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  FirebaseAuthInPutScreen({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<FirebaseAuthBloc, FirebaseAuthState>(
      listener: (context, state) {
        if (state is AuthErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.deepOrange,
              content: Text(
                state.errorMessage,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )));
        }
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 40),
                if (type.isEmail) ...[
                  _textFormField(
                      context: context,
                      controller: emailController,
                      hintText: "email"),
                ],
                if (type.isPassword) ...[
                  _textFormField(
                      context: context,
                      controller: passwordController,
                      hintText: "password"),
                ],
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    switch (type) {
                      case AuthenticationType.signUp:
                        context.read<FirebaseAuthBloc>().add(
                            AuthSignUpWithEmailAndPassword(context,
                                emailController.text, passwordController.text));
                        break;
                      case AuthenticationType.emailSignIn:
                        context.read<FirebaseAuthBloc>().add(
                            AuthSignInWithEmailAndPassword(context,
                                emailController.text, passwordController.text));
                        break;
                      case AuthenticationType.updatePassword:
                        context.read<FirebaseAuthBloc>().add(
                            AuthChangedPasswordUpdate(
                                context, passwordController.text));
                        break;
                      case AuthenticationType.resetPassword:
                        break;
                      default:
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 40,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.amber,
                    ),
                    child: Center(
                      child: Text(
                        _buttonTitle(type),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _buttonTitle(AuthenticationType type) {
    String _title = "Type Error";
    switch (type) {
      case AuthenticationType.signUp:
        _title = "SignUp";
        break;
      case AuthenticationType.emailSignIn:
        _title = "Email Sign In";
        break;
      case AuthenticationType.resetPassword:
        _title = "Reset Password";
        break;
      case AuthenticationType.updatePassword:
        _title = "Password Update";
        break;
      default:
    }
    return _title;
  }

  Padding _textFormField({
    required BuildContext context,
    required TextEditingController controller,
    required String hintText,
    TextInputType? textInputType,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromRGBO(31, 31, 31, 1),
        ),
        height: 50,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            cursorColor: Colors.red,
            controller: controller,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.amber),
            keyboardType: textInputType,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.green),
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
