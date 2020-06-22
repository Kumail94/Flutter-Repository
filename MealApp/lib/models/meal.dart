import 'package:flutter/cupertino.dart';

enum Complexity { Simple, Challenging, Hard }
enum Affordiability { Affordable, Pricey, Luxirious }

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingrediants;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordiability affordiablity;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal(
      {@required this.id,
      @required this.categories,
      @required this.title,
      @required this.imageUrl,
      @required this.ingrediants,
      @required this.steps,
      @required this.duration,
      @required this.complexity,
      @required this.affordiablity,
      @required this.isGlutenFree,
      @required this.isLactoseFree,
      @required this.isVegan,
      @required this.isVegetarian
      }
    );
}
