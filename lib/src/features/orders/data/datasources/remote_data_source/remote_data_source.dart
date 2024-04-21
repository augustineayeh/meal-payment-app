import '../../../../../core/models/success.dart';
import '../../models/order_model.dart';

abstract class OrderRemoteDataSource {
  Future<List<OrderModel>> fetchOrders();
  Future<OrderModel> fetchSingleOrder(String orderId);
  Future<Success> createOrder({required OrderModel order});
}
