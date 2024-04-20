import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import '../../features/vendors/data/datasources/remote_data_source/remote_data_source.dart';
import '../../features/vendors/data/datasources/remote_data_source/remote_data_source_impl.dart';
import '../../features/vendors/data/repositories/vendor_repository_impl.dart';
import '../../features/vendors/domain/repositories/vendor_repository.dart';
import 'package:secure_storage_repository/storage_repository.dart';

import '../../features/schools/data/datasources/remote_data_source/remote_data_source.dart';
import '../../features/schools/data/datasources/remote_data_source/remote_data_source_impl.dart';
import '../../features/schools/data/repositories/school_repository_impl.dart';
import '../../features/schools/domain/repositories/school_repository.dart';
import '../api/api_client.dart';

GetIt locator = GetIt.instance;

Future<void> setUpLocator() async {
  locator.registerLazySingleton<SchoolRepository>(
    () => SchoolRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  locator.registerLazySingleton<SchoolRemoteDataSource>(
    () => SchoolRemoteDataSourceImpl(
      apiClient: locator(),
    ),
  );

  locator.registerLazySingleton<VendorRepository>(
    () => VendorRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  locator.registerLazySingleton<VendorRemoteDataSource>(
    () => VendorRemoteDataSourceImpl(
      apiClient: locator(),
    ),
  );

  locator.registerLazySingleton<ApiClient>(
    () => ApiClient(
      client: locator(),
      secureStorageRepository: locator(),
    ),
  );

  locator.registerLazySingleton<SecureStorageRepository>(
    () => SecureStorageRepository(
      secureStorage: locator(),
    ),
  );
  locator.registerLazySingleton<Client>(Client.new);

  locator.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );
}
