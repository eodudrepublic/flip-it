import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class FirebaseAuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthCheckedCurrentUser extends FirebaseAuthEvent {}

class AuthSignOut extends FirebaseAuthEvent {
  final bool isGoogle;
  AuthSignOut(this.isGoogle);
  @override
  List<Object?> get props => [isGoogle];
}

class AuthSignInWithEmailAndPassword extends FirebaseAuthEvent {
  final BuildContext context;
  final String email;
  final String password;

  AuthSignInWithEmailAndPassword(this.context, this.email, this.password);
  @override
  List<Object?> get props => [context, email, password];
}

class AuthSignUpWithEmailAndPassword extends FirebaseAuthEvent {
  final BuildContext context;
  final String email;
  final String password;

  AuthSignUpWithEmailAndPassword(this.context, this.email, this.password);
  @override
  List<Object?> get props => [context, email, password];
}

class AuthVerifySendEmail extends FirebaseAuthEvent {}

class AuthResetPasswordSendEmail extends FirebaseAuthEvent {}

class AuthChangedPasswordUpdate extends FirebaseAuthEvent {
  final BuildContext context;
  final String password;

  AuthChangedPasswordUpdate(this.context, this.password);
  @override
  List<Object?> get props => [context, password];
}
