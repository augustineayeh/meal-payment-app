import '../models/menu_model.dart';

abstract class MenuRemoteDataSource {
  Future<List<MenuModel>> fetchMenus();
  Future<MenuModel> fetchSingleMenu(String menuId);
}
