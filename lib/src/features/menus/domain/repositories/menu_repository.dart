import 'package:errors/errors.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/models/success.dart';
import '../../data/models/menu_model.dart';

import '../entities/menu.dart';

abstract class MenuRepository {
  Future<Either<Failure, List<Menu>>> fetchMenus();
  Future<Either<Failure, Menu>> fetchSingleMenu(String menuId);
  Future<Either<Failure, Success>> createMenu({required MenuModel menu});
}
