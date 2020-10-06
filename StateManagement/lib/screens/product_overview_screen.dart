import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/app_drawer.dart';
import '../screens/cart_screen.dart';
import '../providers/cart.dart';
import '../widgets/badge.dart';
import '../widgets/products_grid.dart';

enum FilterMenuOptions { All, OnlyFavourates }

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var showFavorateOnly = false;
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop Application'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterMenuOptions selectedValue) {
              if (selectedValue == FilterMenuOptions.OnlyFavourates) {
                showFavorateOnly = true;
              } else {
                showFavorateOnly = false;
              }
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favourates'),
                value: FilterMenuOptions.OnlyFavourates,
              ),
              PopupMenuItem(
                child: Text('All Favourates'),
                value: FilterMenuOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemsCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(showFavorateOnly),
    );
  }
}
