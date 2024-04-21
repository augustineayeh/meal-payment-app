import 'package:errors/errors.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/models/success.dart';
import '../../domain/entities/vendor.dart';
import '../../domain/repositories/vendor_repository.dart';
import '../datasources/remote_data_source/remote_data_source.dart';
import '../models/vendor_model.dart';

class VendorRepositoryImpl extends VendorRepository {
  VendorRepositoryImpl({required VendorRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  final VendorRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, List<Vendor>>> fetchVendors() async {
    try {
      final remoteData = await _remoteDataSource.fetchVendors();

      return right(remoteData);
    } on ServerException catch (e) {
      return left(
        ServerFailure(errorMessage: e.errorMessage),
      );
    }
  }

  @override
  Future<Either<Failure, Vendor>> fetchSingleVendor(String vendorId) async {
    try {
      final remoteData = await _remoteDataSource.fetchSingleVendor(vendorId);
      return right(remoteData);
    } on ServerException catch (e) {
      return left(ServerFailure(errorMessage: e.errorMessage));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Success>> createVendor({
    required VendorModel vendor,
  }) async {
    try {
      print(vendor.toJson());
      final remoteData = await _remoteDataSource.createVendor(vendor: vendor);
      return right(remoteData);
    } on ServerException catch (e) {
      return left(ServerFailure(errorMessage: e.errorMessage));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
