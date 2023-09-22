import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flip_it/DB/authentication/authentication_type.dart';

abstract class FirebaseAuthState extends Equatable {
  final User? user;
  final bool isLoading;
  final SignInProviderState providerState;
  const FirebaseAuthState({
    this.user,
    this.isLoading = false,
    this.providerState = SignInProviderState.empty,
  });
}

class AuthInitState extends FirebaseAuthState {
  const AuthInitState({super.user, super.isLoading, super.providerState});
  @override
  List<Object?> get props => [user, isLoading, providerState];
}

class AuthStateAuthenticated extends FirebaseAuthState {
  const AuthStateAuthenticated(
      {super.user, super.isLoading, super.providerState});

  @override
  List<Object?> get props => [user, isLoading, providerState];
}

class AuthStateUnAuthenticated extends FirebaseAuthState {
  const AuthStateUnAuthenticated();
  @override
  List<Object?> get props => [];
}

class AuthStateLoading extends FirebaseAuthState {
  const AuthStateLoading({super.isLoading});
  @override
  List<Object?> get props => [isLoading];
}

class AuthErrorState extends FirebaseAuthState {
  final String errorMessage;
  const AuthErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
