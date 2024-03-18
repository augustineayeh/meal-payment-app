part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.user = User.empty,
    this.status = AuthenticationStatus.unauthenticated,
  });

  const AuthenticationState.unauthenticated() : this._();

  const AuthenticationState.authenticated({required User user})
      : this._(status: AuthenticationStatus.authenticated);

  final User user;
  final AuthenticationStatus status;

  @override
  List<Object> get props => [
        user,
        status,
      ];
}

enum AuthenticationStatus {
  authenticated,
  unauthenticated,
}
