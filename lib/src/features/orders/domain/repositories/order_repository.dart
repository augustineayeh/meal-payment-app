import 'package:errors/errors.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/models/success.dart';
import '../../data/models/order_model.dart';

import '../entities/order.dart';

abstract class OrderRepository {
  Future<Either<Failure, List<Order>>> fetchOrders();
  Future<Either<Failure, Order>> fetchSingleOrder(String orderId);
   Future<Either<Failure, Success>> createOrder(
      {required OrderModel order});
}
