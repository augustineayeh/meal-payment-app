import 'package:errors/errors.dart';
import 'package:fpdart/fpdart.dart';
import 'package:meal_payment_app/src/core/models/success.dart';
import 'package:meal_payment_app/src/features/auth/domain/domain.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, User>> signup(Signup signup);

  Future<Either<Failure, User>> login(Login login);

  Stream<User> get user;

  Future<User> getUser();

  

  Future<Either<Failure, Success>> logout();
}
