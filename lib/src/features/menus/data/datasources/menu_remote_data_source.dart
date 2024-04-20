import 'package:meal_payment_app/src/features/menus/data/models/menu_model.dart';

abstract class MenuRemoteDataSource {
  Future<List<MenuModel>> fetchMenus();
  Future<MenuModel> fetchSingleMenu(String menuId);
}
