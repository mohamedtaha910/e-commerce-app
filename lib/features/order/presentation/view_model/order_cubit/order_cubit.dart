// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

import 'package:e_commerce_app/features/order/data/models/order_model.dart';
import 'package:e_commerce_app/features/order/data/repos/order_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this.repo) : super(OrderInitial());
  final OrderRepo repo;

  Future<void> getOrders() async {

    emit(OrderLoading());

    final orders = repo.getOrders();

    emit(OrderSuccess(orders));
  }

  Future<void> addOrder(Order order) async {

    await repo.addOrder(order);

    getOrders();
  }


  
}
