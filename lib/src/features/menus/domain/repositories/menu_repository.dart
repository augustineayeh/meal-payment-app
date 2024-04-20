import 'package:errors/errors.dart';
import 'package:fpdart/fpdart.dart';

import '../entities/menu.dart';

abstract class MenuRepository {
  Future<Either<Failure, List<Menu>>> fetchMenus();
  Future<Either<Failure, Menu>> fetchSingleMenu(String menuId);
}
