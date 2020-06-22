import './dummy_data.dart';
import './models/meal.dart';
import './screens/filter_screen.dart';
import './screens/tab_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/categories_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
Map<String , bool> _filters = {
  'gluten' : false,
  'lactose' : false,
  'vegan' : false,
  'vegetarian' : false,
};
List<Meal>_availableMeals = Dummy_Meal;
void _setFilters(Map<String , bool> _filterData) {
  setState(() {
    _filters = _filterData;
    _availableMeals = Dummy_Meal.where((meal){
      if(_filters['gluten'] && !meal.isGlutenFree){
        return false;
      }
      if(_filters['lactose'] && !meal.isLactoseFree){
        return false;
      }
      if(_filters['vegan'] && !meal.isVegan){
        return false;
      }
      if(_filters['vegetarian'] && !meal.isVegetarian){
        return false;
      }
      return true;
      
    }).toList();
  });
} 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deals App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 249, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: CategoryScreen(),
      initialRoute: '/',
      routes: {
        '/': (cxt) => TabScreen(),
        CategoryMeal.routeName: (cxt) => CategoryMeal(_availableMeals),
        MealDetailScreen.routeName: (cxt) => MealDetailScreen(),
        FiltersScreen.routeName:(cxt) => FiltersScreen(_filters , _setFilters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (cxt) => CategoryScreen());
      },
    );
  }
}
