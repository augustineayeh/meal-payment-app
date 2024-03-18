

import 'package:meal_payment_app/src/features/auth/data/data.dart';
import 'package:meal_payment_app/src/features/auth/domain/domain.dart';

abstract class AuthenticationLocalDataSource {
  Future<void> cacheUser({required UserModel user});
  Future<void> deleteCachedUser({required UserModel user});
  Future<User> fetchUserFromCache();
}
