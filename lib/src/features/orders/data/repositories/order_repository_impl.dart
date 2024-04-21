import 'package:errors/errors.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/models/success.dart';
import '../models/order_model.dart';

import '../../domain/entities/order.dart';
import '../../domain/repositories/order_repository.dart';
import '../datasources/remote_data_source/remote_data_source.dart';

class OrderRepositoryImpl extends OrderRepository {
  OrderRepositoryImpl({required OrderRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  final OrderRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, Success>> createOrder({
    required OrderModel order,
  }) async {
    try {
      print(order.toJson());
      final remoteData = await _remoteDataSource.createOrder(order: order);
      return right(remoteData);
    } on ServerException catch (e) {
      return left(ServerFailure(errorMessage: e.errorMessage));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Order>>> fetchOrders() async {
    try {
      final remoteData = await _remoteDataSource.fetchOrders();

      return right(remoteData);
    } on ServerException catch (e) {
      return left(
        ServerFailure(errorMessage: e.errorMessage),
      );
    }
  }

  @override
  Future<Either<Failure, Order>> fetchSingleOrder(String orderId) async {
    try {
      final remoteData = await _remoteDataSource.fetchSingleOrder(orderId);
      return right(remoteData);
    } on ServerException catch (e) {
      return left(ServerFailure(errorMessage: e.errorMessage));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
