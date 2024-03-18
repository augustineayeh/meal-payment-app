import 'dart:async';

import 'package:errors/errors.dart';
import 'package:fpdart/src/either.dart';

import '../../../../core/models/success.dart';
import '../../domain/domain.dart';
import '../data.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  AuthenticationRepositoryImpl({
    required AuthenticationRemoteDataSource remoteDataSource,
    required AuthenticationLocalDataSource localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  final AuthenticationRemoteDataSource _remoteDataSource;
  final AuthenticationLocalDataSource _localDataSource;

  final StreamController<User> _userController = StreamController<User>();
  @override
  Future<Either<Failure, User>> login(Login login) async {
    try {
      final user = await _remoteDataSource.login(
        LoginModel(
          email: login.email,
          password: login.password,
        ),
      );
      // Cache the user
      _localDataSource.cacheUser(user: user);
      // Add user to Stream
      _userController.add(user);
      return right(user);
    } on ServerException catch (e) {
      return left(ServerFailure(errorMessage: e.errorMessage));
    } on LoginWithGoogleError catch (e) {
      return left(ServerFailure(errorMessage: e.errorMessage));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  //! repeated code: refactor
  @override
  Future<Either<Failure, User>> signup(Signup signup) async {
    try {
      final user = await _remoteDataSource.signup(
        SignupModel(
          firstName: signup.firstName,
          lastName: signup.lastName,
          email: signup.email,
          password: signup.password,
        ),
      );
      // Cache the user
      _localDataSource.cacheUser(user: user);
      // Add user to Stream
      _userController.add(user);
      return right(user);
    } on ServerException catch (e) {
      return left(ServerFailure(errorMessage: e.errorMessage));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Stream<User> get user => _userController.stream;

  @override
  Future<User> getUser() async {
    final user = await _localDataSource.fetchUserFromCache();
    return user;
  }



 

  @override
  Future<Either<Failure, Success>> logout() async {
    try {
      await _remoteDataSource.logout();
      return right(Success.instance);
    } on ServerException catch (e) {
      return left(ServerFailure(errorMessage: e.errorMessage));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
