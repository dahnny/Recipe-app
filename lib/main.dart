import 'package:flutter/material.dart';
import 'package:food_app/screens/meal_detail_screen.dart';
import 'package:food_app/screens/tabs_screen.dart';
import 'file:///C:/Users/Daniel%20Ogbuti/AndroidStudioProjects/food_app/lib/screens/category_screen.dart';
import 'widgets/category_item.dart';
import 'file:///C:/Users/Daniel%20Ogbuti/AndroidStudioProjects/food_app/lib/screens/category_meal_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
          CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(),
          MealDetailScreen.routeName: (ctx) => MealDetailScreen()
      },
    );
  }
}
