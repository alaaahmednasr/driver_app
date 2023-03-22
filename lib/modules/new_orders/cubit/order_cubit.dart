// ignore_for_file: avoid_print

import 'package:driver_app/shared/network/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/order_model/order_model.dart';
import '../../../shared/network/remote/dio.dart';
import 'order_states.dart';

class OrderCubit extends Cubit<OrderStates> {
  OrderCubit() : super(InitialOrderState());

  static OrderCubit getCubit(context) => BlocProvider.of(context);

  double ratevalue = 2.5;

  void changeRate(double value){
 ratevalue = value;
 emit(ChangRateState());
  }

  OrderModel? orderModel;

  Future<void> getOrder() async {
    emit(OrderLoadingState());

    await DioHelper.getData(methodUrl: GET_ORDER, query: {
      'api_token':
          'ThPhwWvddWnX8cSjmiZTQ7yry0XrBfYKsN9A5LDcvUypHCwaNMCfWFhpB1SR',
      'delivery': '1',
      'pickup': '1',
    }).then((value) {
      orderModel = OrderModel.fromJson(value.data);

      print(orderModel!.message);

      emit(OrderScusessState(orderModel!));
    });
    // .catchError((error) {
    //   print(error.toString());
    //   emit(OrderErrorState(error.toString()));
    // });
  }
}
