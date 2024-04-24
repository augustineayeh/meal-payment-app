import 'package:errors/errors.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/models/success.dart';
import '../../domain/entities/parent.dart';
import '../../domain/repositories/parent_repository.dart';
import '../datasources/remote_data_source/remote_data_source.dart';
import '../models/parent_model.dart';

class ParentRepositoryImpl extends ParentRepository {
  ParentRepositoryImpl({required ParentRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  final ParentRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, Success>> createParent({
    required ParentModel parent,
  }) async {
    try {
      print(parent.toJson());
      final remoteData = await _remoteDataSource.createParent(parent: parent);
      return right(remoteData);
    } on ServerException catch (e) {
      return left(ServerFailure(errorMessage: e.errorMessage));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Parent>>> fetchParents() async {
    try {
      final remoteData = await _remoteDataSource.fetchParents();

      return right(remoteData);
    } on ServerException catch (e) {
      return left(
        ServerFailure(errorMessage: e.errorMessage),
      );
    }
  }

  @override
  Future<Either<Failure, Parent>> fetchSingleParent(String parentId) async {
    try {
      final remoteData = await _remoteDataSource.fetchSingleParent(parentId);
      return right(remoteData);
    } on ServerException catch (e) {
      return left(ServerFailure(errorMessage: e.errorMessage));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
