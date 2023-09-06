import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flip_it/DB/authentication/authentication_type.dart';
import 'package:flip_it/DB/authentication/firebase_auth_event.dart';
import 'package:flip_it/DB/authentication/firebase_auth_state.dart';
import 'package:flip_it/main.dart';

class FirebaseAuthBloc extends Bloc<FirebaseAuthEvent, FirebaseAuthState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseAuthBloc() : super(const AuthInitState()) {
    on<AuthCheckedCurrentUser>(_checkedCurrentUser);
    on<AuthSignOut>(_signOut);
    on<AuthSignInWithEmailAndPassword>(_signInWithEmailAndPassword);
    on<AuthSignUpWithEmailAndPassword>(_signUpWithEmailAndPassword);
    on<AuthChangedPasswordUpdate>(_changedPasswordUpdate);
    on<AuthVerifySendEmail>(_verifySendEmail);
    on<AuthResetPasswordSendEmail>(_resetPasswordSendEmail);
    add(AuthCheckedCurrentUser());
  }

  Future<void> _signOut(
    AuthSignOut event,
    Emitter<FirebaseAuthState> emit,
  ) async {
    await _firebaseAuth.signOut().then((_) {
      emit(const AuthStateUnAuthenticated());
    });
  }

  Future<void> _checkedCurrentUser(
    AuthCheckedCurrentUser event,
    Emitter<FirebaseAuthState> emit,
  ) async {
    User? _user = _firebaseAuth.currentUser;
    if (_user != null) {
      SignInProviderState _provider = SignInProviderState.empty;
      if (_user.providerData.isNotEmpty) {
        if (_user.providerData[0].providerId == "password") {
          _provider = _user.emailVerified
              ? SignInProviderState.emailVerify
              : SignInProviderState.emailUnVerify;
        }
      }
      emit(AuthStateAuthenticated(user: _user, providerState: _provider));
    } else {
      emit(const AuthStateUnAuthenticated());
    }
  }

  Future<void> _signInWithEmailAndPassword(
    AuthSignInWithEmailAndPassword event,
    Emitter<FirebaseAuthState> emit,
  ) async {
    HapticFeedback.mediumImpact();
    if (event.email.isNotEmpty && event.password.isNotEmpty) {
      try {
        UserCredential _credential =
            await _firebaseAuth.signInWithEmailAndPassword(
                email: event.email, password: event.password);
        if (_credential.user != null) {
          emit(AuthStateAuthenticated(
            user: _credential.user,
            providerState: _credential.user!.emailVerified
                ? SignInProviderState.emailVerify
                : SignInProviderState.emailUnVerify,
          ));
          Navigator.of(event.context).pop();
        }
      } on FirebaseException catch (error) {
        String? _errorCode;
        switch (error.code) {
          case "invalid-email":
            _errorCode = error.code;
            break;
          case "user-disabled":
            _errorCode = error.code;
            break;
          case "user-not-found":
            _errorCode = error.code;
            break;
          case "wrong-password":
            _errorCode = error.code;
            break;
          default:
            _errorCode = null;
        }
        emit(AuthErrorState(_errorCode ?? "Server Error"));
      }
    } else {
      emit(AuthErrorState(event.email.isEmpty
          ? "Email Empty"
          : event.password.isEmpty
              ? "Password Empty"
              : "Server Error"));
    }
  }

  Future<void> _signUpWithEmailAndPassword(
    AuthSignUpWithEmailAndPassword event,
    Emitter<FirebaseAuthState> emit,
  ) async {
    HapticFeedback.mediumImpact();
    if (event.email.isNotEmpty && event.password.isNotEmpty) {
      try {
        UserCredential _credential =
            await _firebaseAuth.createUserWithEmailAndPassword(
                email: event.email, password: event.password);
        if (_credential.user != null) {
          emit(AuthStateAuthenticated(
            user: _credential.user,
            providerState: SignInProviderState.emailUnVerify,
          ));
          Navigator.of(event.context).pop();
        }
      } on FirebaseAuthException catch (error) {
        String? _errorCode;
        switch (error.code) {
          case "email-already-in-use":
            _errorCode = error.code;
            break;
          case "invalid-email":
            _errorCode = error.code;
            break;
          case "weak-password":
            _errorCode = error.code;
            break;
          case "operation-not-allowed":
            _errorCode = error.code;
            break;
          default:
            _errorCode = null;
        }
        emit(AuthErrorState(_errorCode ?? "Server Error"));
      }
    } else {
      emit(AuthErrorState(event.email.isEmpty
          ? "Email Empty"
          : event.password.isEmpty
              ? "Password Empty"
              : "Server Error"));
    }
  }

  Future<void> _verifySendEmail(
    AuthVerifySendEmail event,
    Emitter<FirebaseAuthState> emit,
  ) async {
    HapticFeedback.mediumImpact();
    if (state.user != null) {
      await state.user!.sendEmailVerification().then((_) {
        emit(const AuthStateUnAuthenticated());
      });
    }
  }

  Future<void> _resetPasswordSendEmail(
    AuthResetPasswordSendEmail event,
    Emitter<FirebaseAuthState> emit,
  ) async {
    if (state.user != null) {
      HapticFeedback.mediumImpact();
      await _firebaseAuth.sendPasswordResetEmail(email: state.user!.email!);
    }
  }

  Future<void> _changedPasswordUpdate(
    AuthChangedPasswordUpdate event,
    Emitter<FirebaseAuthState> emit,
  ) async {
    if (state.user != null) {
      try {
        await state.user!.updatePassword(event.password).then((_) {
          User? _updateUser = _firebaseAuth.currentUser;
          if (_updateUser != null) {
            emit(AuthStateAuthenticated(
                user: _updateUser,
                providerState: _updateUser.emailVerified
                    ? SignInProviderState.emailVerify
                    : SignInProviderState.emailUnVerify));
          } else {
            emit(const AuthStateUnAuthenticated());
          }
          Navigator.of(event.context).pop();
        });
      } on FirebaseException catch (error) {
        String? _errorCode;
        switch (error.code) {
          case "invalid-verification-code":
            _errorCode = error.code;
            break;
          case "invalid-verification-id":
            _errorCode = error.code;
            break;
          default:
            _errorCode = null;
        }
        emit(AuthErrorState(_errorCode ?? "Server Error"));
      }
    }
  }

  @override
  void onChange(Change<FirebaseAuthState> change) {
    super.onChange(change);
    logger.e(change);
  }

  @override
  void onTransition(
      Transition<FirebaseAuthEvent, FirebaseAuthState> transition) {
    super.onTransition(transition);
    logger.e(transition);
  }
}
