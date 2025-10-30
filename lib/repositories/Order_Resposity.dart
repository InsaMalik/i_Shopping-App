import 'package:shoppingapp/MyOrder/Screen/Model/My_Order%20Model.dart';

class OrderResposity {
  List<Order> getOrders(){
    return[
      Order(
      OrderNumber: '12345678',
      itemCount: 2,
     totalAmount: 2938.9,
      status: OrderStatus.active,
       imageUrl: 'images/shoe.jpg',
        orderDate: DateTime.now().subtract(Duration(hours: 2)),
        ),
        Order(
      OrderNumber: '1298758',
      itemCount: 2,
     totalAmount: 2938.9,
      status: OrderStatus.active,
       imageUrl: 'images/shoes2.jpg',
        orderDate: DateTime.now().subtract(Duration(hours: 1)),
        ),
        Order(
      OrderNumber: '7863542',
      itemCount: 1,
     totalAmount: 180.0,
      status: OrderStatus.completed,
       imageUrl: 'images/laptop.jpg',
        orderDate: DateTime.now().subtract(Duration(hours: 3)),
        ),
        Order(
      OrderNumber: '9758423',
      itemCount: 2,
     totalAmount: 2938.9,
      status: OrderStatus.cancelled,
       imageUrl: 'images/shoe2.jpg',
        orderDate: DateTime.now().subtract(Duration(hours: 4)),
        ),
    ];
  }
  List<Order> getOrdersByStatus(OrderStatus status){
   return getOrders().where((order)=>order.status==status).toList();
  }
}
