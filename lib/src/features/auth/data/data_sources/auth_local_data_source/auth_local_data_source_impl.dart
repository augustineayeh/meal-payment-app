import 'dart:convert';

import 'package:secure_storage_repository/storage_repository.dart';

import '../../../../../core/constants/secure_storage_consts.dart';
import '../../../domain/domain.dart';
import '../../data.dart';

class AuthenticationLocalDataSourceImpl extends AuthenticationLocalDataSource {
  AuthenticationLocalDataSourceImpl(
      {required SecureStorageRepository storageRepository})
      : _storageRepository = storageRepository;

  final SecureStorageRepository _storageRepository;
  @override
  Future<void> cacheUser({required UserModel user}) async {
    final userString = jsonEncode(user.toJson());
    await _storageRepository.write(
      key: SecureStorageConsts.user,
      value: userString,
    );
  }

  @override
  Future<void> deleteCachedUser({required UserModel user}) async {
    await _storageRepository.delete(key: SecureStorageConsts.user);
  }

  @override
  Future<User> fetchUserFromCache() async {
    final userString =
        await _storageRepository.read(key: SecureStorageConsts.user);
    if (userString == null) {
      return User.empty;
    }
    final userMap = jsonDecode(userString) as Map<String, dynamic>;
    return UserModel.fromJson(userMap);
  }
}
