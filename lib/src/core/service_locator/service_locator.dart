import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:secure_storage_repository/storage_repository.dart';

import '../../features/auth/data/data_sources/auth_remote_data_source/auth_remote_data_source.dart';
import '../../features/auth/data/data_sources/auth_remote_data_source/auth_remote_data_source_impl.dart';
import '../../features/auth/data/repository/authentication_repository_impl.dart';
import '../../features/auth/domain/repository/repository.dart';
import '../../features/menus/data/datasources/menu_remote_data_source.dart';
import '../../features/menus/data/datasources/menu_remote_data_source_impl.dart';
import '../../features/menus/data/repositories/menu_repository_impl.dart';
import '../../features/menus/domain/repositories/menu_repository.dart';
import '../../features/orders/data/datasources/remote_data_source/remote_data_source.dart';
import '../../features/orders/data/datasources/remote_data_source/remote_data_source_impl.dart';
import '../../features/orders/data/repositories/order_repository_impl.dart';
import '../../features/orders/domain/repositories/order_repository.dart';
import '../../features/schools/data/datasources/remote_data_source/remote_data_source.dart';
import '../../features/schools/data/datasources/remote_data_source/remote_data_source_impl.dart';
import '../../features/schools/data/repositories/school_repository_impl.dart';
import '../../features/schools/domain/repositories/school_repository.dart';
import '../../features/students/data/datasources/remote_data_source/remote_data_source.dart';
import '../../features/students/data/datasources/remote_data_source/remote_data_source_impl.dart';
import '../../features/students/data/repositories/student_repository_impl.dart';
import '../../features/students/domain/repositories/student_repository.dart';
import '../../features/vendors/data/datasources/remote_data_source/remote_data_source.dart';
import '../../features/vendors/data/datasources/remote_data_source/remote_data_source_impl.dart';
import '../../features/vendors/data/repositories/vendor_repository_impl.dart';
import '../../features/vendors/domain/repositories/vendor_repository.dart';
import '../api/api_client.dart';

GetIt locator = GetIt.instance;

Future<void> setUpLocator() async {
  locator.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
        remoteDataSource: locator(), localDataSource: locator()),
  );
  locator.registerLazySingleton<AuthenticationRemoteDataSource>(
    () => AuthenticationRemoteDataSourceImpl(
      apiClient: locator(),
    ),
  );

  locator.registerLazySingleton<MenuRepository>(
    () => MenuRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  locator.registerLazySingleton<MenuRemoteDataSource>(
    () => MenuRemoteDataSourceImpl(
      apiClient: locator(),
    ),
  );

  locator.registerLazySingleton<OrderRepository>(
    () => OrderRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  locator.registerLazySingleton<OrderRemoteDataSource>(
    () => OrderRemoteDataSourceImpl(
      apiClient: locator(),
    ),
  );

  locator.registerLazySingleton<StudentRepository>(
    () => StudentRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<StudentRemoteDataSource>(
    () => StudentRemoteDataSourceImpl(
      apiClient: locator(),
    ),
  );

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
