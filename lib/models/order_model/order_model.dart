class OrderModel {
   bool? success;
   String? message;
  List<Data>? data;

  OrderModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    // if (json['data'] != null) {
    //   data = <Data>[];
    //   json['data'].forEach((v) {
    //     data!.add( Data.fromJson(v));
    //   });
    // }data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }
}
class Data {
    int? orderId;
    String? clientName;
    String? driverName;
    String? receiveMethod;
    num? total;
    String? paymentMethod;
    String? orderStatus;
    String? preparingTime;
    String? expiredAt;
    int? orderStatusId;
    String? timezone;
  
  Data.fromJson(Map<String, dynamic> json){
    orderId = json['order_id'];
    clientName = json['client_name'];
    driverName = json['driver_name'];
    receiveMethod = json['receive_method'];
    total = json['total'];
    paymentMethod = json['payment_method'];
    orderStatus = json['order_status'];
    preparingTime =json['preparing_time'];
    expiredAt = json['expired_at'];
    orderStatusId = json['order_status_id'];
    timezone = json['timezone'];
  }}