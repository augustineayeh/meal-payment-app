import 'package:errors/errors.dart';
import 'package:fpdart/fpdart.dart';

import '../entities/vendor.dart';

abstract class VendorRepository {
  Future<Either<Failure, List<Vendor>>> fetchVendors();
  Future<Either<Failure, Vendor>> fetchSingleVendor(String vendorId);
}
