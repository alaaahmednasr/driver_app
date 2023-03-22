import '../../../models/order_model/order_model.dart';

abstract class OrderStates {}

class InitialOrderState extends OrderStates {}

class ChangRateState extends OrderStates {}


class OrderLoadingState extends OrderStates {}

class OrderScusessState extends OrderStates {
  OrderModel orderModel;
  
  OrderScusessState(this.orderModel);
}

class OrderErrorState extends OrderStates {
  final String? error;

  OrderErrorState(this.error);
}
