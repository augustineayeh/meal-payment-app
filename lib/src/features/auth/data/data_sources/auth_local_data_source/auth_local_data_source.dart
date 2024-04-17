

import '../../../domain/domain.dart';
import '../../data.dart';

abstract class AuthenticationLocalDataSource {
  Future<void> cacheUser({required UserModel user});
  Future<void> deleteCachedUser({required UserModel user});
  Future<User> fetchUserFromCache();
}
