import '../../../../../core/models/success.dart';
import '../../models/parent_model.dart';

abstract class ParentRemoteDataSource {
  Future<List<ParentModel>> fetchParents();
  Future<ParentModel> fetchSingleParent(String parentId);
  Future<Success> createParent({required ParentModel parent});
}
