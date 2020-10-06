import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/app_drawer.dart';
import '../providers/order.dart' show Order;
import '../widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = "/orders-screen";
  @override
  Widget build(BuildContext context) {
    final orderCart = Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orderCart.orders.length,
        itemBuilder: (ctx, index) => OrderItem(orderCart.orders[index]),
      ),
    );
  }
}
