import '../screens/filter_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData data, Function funtionHandler) {
    return ListTile(
      leading: Icon(
        data,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: funtionHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(15),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).accentColor,
          child: Text(
            'Cooking Up',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        buildListTile('Meals', Icons.restaurant,
            () => Navigator.of(context).pushReplacementNamed('/')),
        buildListTile('Filters', Icons.settings,
            () => Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName)),
      ],
    ));
  }
}
