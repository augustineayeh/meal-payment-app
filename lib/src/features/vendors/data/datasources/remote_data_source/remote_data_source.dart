import 'package:meal_payment_app/src/features/vendors/data/models/vendor_model.dart';

abstract class VendorRemoteDataSource {
  Future<List<VendorModel>> fetchVendors();
  Future<VendorModel> fetchSingleVendor(String vendorId);
}
