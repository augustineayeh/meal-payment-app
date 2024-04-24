import 'package:errors/errors.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/models/success.dart';
import '../../domain/entities/menu.dart';
import '../../domain/repositories/menu_repository.dart';
import '../datasources/menu_remote_data_source.dart';
import '../models/menu_model.dart';

class MenuRepositoryImpl extends MenuRepository {
  MenuRepositoryImpl({required MenuRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  final MenuRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, List<Menu>>> fetchMenus() async {
    try {
      final remoteData = await _remoteDataSource.fetchMenus();

      return right(remoteData);
    } on ServerException catch (e) {
      return left(
        ServerFailure(errorMessage: e.errorMessage),
      );
    }
  }

  @override
  Future<Either<Failure, Menu>> fetchSingleMenu(String menuId) async {
    try {
      final remoteData = await _remoteDataSource.fetchSingleMenu(menuId);
      return right(remoteData);
    } on ServerException catch (e) {
      return left(ServerFailure(errorMessage: e.errorMessage));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Success>> createMenu({
    required MenuModel menu,
  }) async {
    try {
      print(menu.toJson());
      final remoteData = await _remoteDataSource.createMenu(menu: menu);
      return right(remoteData);
    } on ServerException catch (e) {
      return left(ServerFailure(errorMessage: e.errorMessage));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
