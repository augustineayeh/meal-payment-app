import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/auth/domain/domain.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(
      {required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(const AuthenticationState.unauthenticated()) {
    on<AuthenticationUserChangedEvent>(_onAuthenticationUserChangedEvent);
    on<LogoutUserEvent>(_onLogoutUserEvent);
    _userStreamSubscription = _authenticationRepository.user.listen((user) {
      add(AuthenticationUserChangedEvent(user: user));
    });
  }

  late StreamSubscription<User> _userStreamSubscription;

  @override
  Future<void> close() async {
    _userStreamSubscription.cancel();
    super.close();
  }

  final AuthenticationRepository _authenticationRepository;

  Future<void> _onAuthenticationUserChangedEvent(
      AuthenticationUserChangedEvent event,
      Emitter<AuthenticationState> emit) async {
    event.user != User.empty
        ? emit(AuthenticationState.authenticated(user: event.user))
        : emit(const AuthenticationState.unauthenticated());
  }

  Future<void> _onLogoutUserEvent(
      LogoutUserEvent event, Emitter<AuthenticationState> emit) async {
    add(const AuthenticationUserChangedEvent(user: User.empty));
    _authenticationRepository.logout();
  }
}
