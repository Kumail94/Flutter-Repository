import './models/meal.dart';
import './models/category.dart';
import 'package:flutter/material.dart';

const Dummy_Categories = const [
  Category(
    id: 'c1',
    title: 'Pizza',
    colors: Colors.purple,
  ),
  Category(
    id: 'c2',
    title: 'Xander Club Sandwich',
    colors: Colors.lime,
  ),
  Category(
    id: 'c3',
    title: 'Zinger Burger',
    colors: Colors.grey,
  ),
  Category(
    id: 'c4',
    title: 'Malai Boti',
    colors: Colors.blue,
  ),
  Category(
    id: 'c5',
    title: 'Mutton Salan',
    colors: Colors.yellow,
  ),
  Category(
    id: 'c6',
    title: 'Chicken Biryani',
    colors: Colors.green,
  ),
  Category(
    id: 'c7',
    title: 'Chicken Korma',
    colors: Colors.brown,
  ),
  Category(
    id: 'c8',
    title: 'Chicken Karahi',
    colors: Colors.pink,
  ),
];

const Dummy_Meal = const [
  Meal(
    id: 'm1',
    categories: [
      'c1',
      'c5',
    ],
    title: 'Super-Grill',
    imageUrl: '',
    ingrediants: [
      'protein',
      'carbs',
      'calories',
      'vitamins',
    ],
    steps: [
      'Wash the meat properly.',
      'Cut in to small pieces.',
      'Put masalas on it.'
          'Fry in to Pan',
    ],
    duration: 10,
    complexity: Complexity.Simple,
    affordiablity: Affordiability.Pricey,
    isGlutenFree: true,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: true,
  ),
  Meal(
    id: 'm1',
    categories: [
      'Zinger',
      'Broast',
      'Mutton',
    ],
    title: 'Grill',
    imageUrl: '',
    ingrediants: [
      'protein',
      'carbs',
      'calories',
      'vitamins',
    ],
    steps: [
      'Wash the meat properly.',
      'Cut in to small pieces.',
      'Put masalas on it.'
          'Fry in to Pan',
    ],
    duration: 10,
    complexity: Complexity.Simple,
    affordiablity: Affordiability.Pricey,
    isGlutenFree: true,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: true,
  ),
  Meal(
    id: 'm1',
    categories: [
      'Zinger',
      'Broast',
      'Mutton',
    ],
    title: 'Grill',
    imageUrl: '',
    ingrediants: [
      'protein',
      'carbs',
      'calories',
      'vitamins',
    ],
    steps: [
      'Wash the meat properly.',
      'Cut in to small pieces.',
      'Put masalas on it.'
          'Fry in to Pan',
    ],
    duration: 10,
    complexity: Complexity.Simple,
    affordiablity: Affordiability.Pricey,
    isGlutenFree: true,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: true,
  ),
  Meal(
    id: 'm1',
    categories: [
      'Zinger',
      'Broast',
      'Mutton',
    ],
    title: 'Grill',
    imageUrl: '',
    ingrediants: [
      'protein',
      'carbs',
      'calories',
      'vitamins',
    ],
    steps: [
      'Wash the meat properly.',
      'Cut in to small pieces.',
      'Put masalas on it.'
          'Fry in to Pan',
    ],
    duration: 10,
    complexity: Complexity.Simple,
    affordiablity: Affordiability.Pricey,
    isGlutenFree: true,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: true,
  ),
  Meal(
    id: 'm1',
    categories: [
      'Zinger',
      'Broast',
      'Mutton',
    ],
    title: 'Grill',
    imageUrl: '',
    ingrediants: [
      'protein',
      'carbs',
      'calories',
      'vitamins',
    ],
    steps: [
      'Wash the meat properly.',
      'Cut in to small pieces.',
      'Put masalas on it.'
          'Fry in to Pan',
    ],
    duration: 10,
    complexity: Complexity.Simple,
    affordiablity: Affordiability.Pricey,
    isGlutenFree: true,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: true,
  ),
  Meal(
    id: 'm1',
    categories: [
      'Zinger',
      'Broast',
      'Mutton',
    ],
    title: 'Grill',
    imageUrl: '',
    ingrediants: [
      'protein',
      'carbs',
      'calories',
      'vitamins',
    ],
    steps: [
      'Wash the meat properly.',
      'Cut in to small pieces.',
      'Put masalas on it.'
          'Fry in to Pan',
    ],
    duration: 10,
    complexity: Complexity.Simple,
    affordiablity: Affordiability.Pricey,
    isGlutenFree: true,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: true,
  ),
  Meal(
    id: 'm1',
    categories: [
      'Zinger',
      'Broast',
      'Mutton',
    ],
    title: 'Grill',
    imageUrl: '',
    ingrediants: [
      'protein',
      'carbs',
      'calories',
      'vitamins',
    ],
    steps: [
      'Wash the meat properly.',
      'Cut in to small pieces.',
      'Put masalas on it.'
          'Fry in to Pan',
    ],
    duration: 10,
    complexity: Complexity.Simple,
    affordiablity: Affordiability.Pricey,
    isGlutenFree: true,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: true,
  ),
  Meal(
    id: 'm1',
    categories: [
      'Zinger',
      'Broast',
      'Mutton',
    ],
    title: 'Grill',
    imageUrl: '',
    ingrediants: [
      'protein',
      'carbs',
      'calories',
      'vitamins',
    ],
    steps: [
      'Wash the meat properly.',
      'Cut in to small pieces.',
      'Put masalas on it.'
          'Fry in to Pan',
    ],
    duration: 10,
    complexity: Complexity.Simple,
    affordiablity: Affordiability.Pricey,
    isGlutenFree: true,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: true,
  ),
];
