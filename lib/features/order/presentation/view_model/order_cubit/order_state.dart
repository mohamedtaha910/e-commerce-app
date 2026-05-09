part of 'order_cubit.dart';


abstract class OrderState {}

class OrderInitial extends OrderState {}
class OrderLoading extends OrderState {}
class OrderSuccess extends OrderState {
  final List<Order> orders;

  OrderSuccess(this.orders);
}



