import '../../../../../core/models/success.dart';
import '../../models/vendor_model.dart';

abstract class VendorRemoteDataSource {
  Future<List<VendorModel>> fetchVendors();
  Future<VendorModel> fetchSingleVendor(String vendorId);
  Future<Success> createVendor({required VendorModel vendor});
}
