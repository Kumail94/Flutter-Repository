import 'package:first_app/helpers/custom_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/splash_screen.dart';
import './providers/auth.dart';
import './screens/auth_screen.dart';
import './screens/product_overview_screen.dart';
import './screens/product_details_screen.dart';
import './screens/edit_product_screen.dart';
import './screens/order_Screen.dart';
import './screens/user_product_screen.dart';
import './providers/order.dart';
import './screens/cart_screen.dart';
import './providers/cart.dart';
import './providers/products.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Auth(),
          ),
          // ignore: missing_required_param
          ChangeNotifierProxyProvider<Auth, Products>(
            update: (_, authData, previousProducts) => Products(
                authData.token,
                authData.userId,
                previousProducts == null ? [] : previousProducts.items),
          ),
          ChangeNotifierProvider.value(
            value: Cart(),
          ),
          // ignore: missing_required_param
          ChangeNotifierProxyProvider<Auth, Order>(
            update: (_, authData, previousOrders) => Order(
                authData.token,
                previousOrders.userId,
                previousOrders == null ? [] : previousOrders.orders),
          ),
        ],
        child: Consumer<Auth>(
          builder: (cxt, authData, _) => MaterialApp(
            title: 'Shop App',
            theme: ThemeData(
              primarySwatch: Colors.purple,
              accentColor: Colors.deepOrange,
              pageTransitionsTheme: PageTransitionsTheme(builders: {
                TargetPlatform.android:CustomPageTransitionBuilder(),
                TargetPlatform.iOS:CustomPageTransitionBuilder(),
              },
              ),
            ),
            home: authData.isAuth
                ? ProductOverviewScreen()
                : FutureBuilder(
                    future: authData.tryAutoLogin(),
                    builder: (cxt, routeSanpShot) =>
                        routeSanpShot.connectionState == ConnectionState.waiting
                            ? SplashScreen()
                            : AuthScreen()),
            routes: {
              // '/': (ctx) => ProductOverviewScreen(),
              ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
              CartScreen.routeName: (ctx) => CartScreen(),
              OrderScreen.routeName: (ctx) => OrderScreen(),
              UserProductScreen.routeName: (ctx) => UserProductScreen(),
              EditProductScreen.routeName: (ctx) => EditProductScreen(),
            },
          ),
        )
        );
  }
}
