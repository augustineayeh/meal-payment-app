import 'package:errors/errors.dart';
import 'package:fpdart/fpdart.dart';
import '../entities/order.dart';

import '../../../../core/models/success.dart';
import '../../data/models/order_model.dart';

abstract class OrderRepository {
  Future<Either<Failure, List<OrderEntity>>> fetchOrders();
  Future<Either<Failure, OrderEntity>> fetchSingleOrder(String orderId);
  Future<Either<Failure, Success>> createOrder({required OrderModel order});
}
