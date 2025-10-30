import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shoppingapp/MyOrder/Screen/Model/My_Order%20Model.dart';
import 'package:shoppingapp/MyOrder/Widgets/order_widgets.dart';
import 'package:shoppingapp/repositories/Order_Resposity.dart';
import 'package:shoppingapp/utilities/App_textStyle.dart';

class MyOrderScreen extends StatelessWidget {
  final OrderResposity _repository = OrderResposity();
 MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness ==Brightness.dark;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
          onPressed: ()=>Get.back(),
           icon: Icon(Icons.arrow_back_ios,
           color: isDark ? Colors.white:Colors.black,
           ),
           ),
          title: Text(
            'My Orders',
            style: AppTextStyle.withColor(
              AppTextStyle.h3,
              isDark ? Colors.white:Colors.black,
            ),
          ),
          bottom: TabBar(
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: isDark ? Colors.grey[400]: Colors.grey[600],
            indicatorColor: Theme.of(context).primaryColor,
            tabs: [
              Tab(text : 'Active'),
              Tab(text : 'Completed'),
              Tab(text : 'Cancelled'),
            ]
            ),
        ),
        body: TabBarView(
          children: [
            _buildOrderList(context,OrderStatus.active),
            _buildOrderList(context,OrderStatus.completed),
            _buildOrderList(context,OrderStatus.cancelled),
          ]
          ),
      ),
    );
  }

  Widget _buildOrderList(BuildContext context, OrderStatus status){
    final isDark = Theme.of(context).brightness ==Brightness.dark;
    final order = _repository.getOrdersByStatus(status);
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: order.length,
      itemBuilder: (context,index)=> Ordercard(
        order: order[index],
        onViewDetails: (){},
      ),
      );
  }
}