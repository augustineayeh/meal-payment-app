import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/order_cubit.dart';
import '../widgets/orders_loaded.dart';

import '../../../../core/service_locator/service_locator.dart';
import '../../domain/repositories/order_repository.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit(
        orderRepository: locator<OrderRepository>(),
      ),
      child: const OrdersViewNew(),
    );
  }
}

class OrdersViewNew extends StatefulWidget {
  const OrdersViewNew({super.key});

  @override
  State<OrdersViewNew> createState() => _OrdersViewNewState();
}

class _OrdersViewNewState extends State<OrdersViewNew> {
  @override
  void initState() {
    super.initState();
    context.read<OrderCubit>().fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text('Orders'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              if (state.status == OrderStatus.success) {
                if (state.orders.isEmpty) {
                  return const Center(
                    child: Text(
                      'You have no orders yet',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  );
                }
                return OrdersLoaded(
                  orders: state.orders.reversed.toList(),
                  // constraints: constraints,
                );
              } else if (state.status == OrderStatus.failure) {
                return Center(
                  child: Text('${state.errorMessage}'),
                );
              }
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            },
          );
        },
      ),
    );
  }
}
