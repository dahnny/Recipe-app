import 'package:flutter/material.dart';
import 'package:food_app/dummy-data.dart';
import 'package:food_app/screens/filters_screen.dart';
import 'package:food_app/screens/meal_detail_screen.dart';
import 'package:food_app/screens/tabs_screen.dart';
import 'models/meal.dart';
import 'screens/category_meal_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool > _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian':false,
  };

  List<Meal> availableMeals = DUMMY_MEALS;

  void _setFilters (Map<String, bool>filterData){
    setState(() {

      _filters = filterData;
      availableMeals = DUMMY_MEALS.where((meal){
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
        title: 'Deli Meals',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.bold
              )),
        ),
//        home: CategoryScreen(),
      //This defines the category-meal-screen route
      routes: {
          //The '/' defines the path of the homescreen
          '/':(ctx) => TabsScreen(),
          CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(availableMeals),
          MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FiltersScreen.routeName: (ctx)=> FiltersScreen(_setFilters, _filters)

      },
    );
  }
}
