import 'package:errors/errors.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/models/success.dart';
import '../../data/models/parent_model.dart';

import '../entities/parent.dart';

abstract class ParentRepository {
  Future<Either<Failure, List<Parent>>> fetchParents();
  Future<Either<Failure, Parent>> fetchSingleParent(String parentId);
   Future<Either<Failure, Success>> createParent(
      {required ParentModel parent});
}
