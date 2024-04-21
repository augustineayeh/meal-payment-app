import 'package:errors/errors.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/models/success.dart';
import '../../data/models/vendor_model.dart';

import '../entities/vendor.dart';

abstract class VendorRepository {
  Future<Either<Failure, List<Vendor>>> fetchVendors();
  Future<Either<Failure, Vendor>> fetchSingleVendor(String vendorId);
    Future<Either<Failure, Success>> createVendor(
      {required VendorModel vendor});
}
