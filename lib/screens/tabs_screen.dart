import 'package:flutter/material.dart';
import 'package:food_app/screens/category_meal_screen.dart';
import 'package:food_app/screens/category_screen.dart';
import 'package:food_app/screens/main_drawer.dart';

import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  final List<Map<String, Object>> pages = [
    {'page': CategoryScreen(), 'title': 'Category'},
    {'page': FavoritesScreen(), 'title': 'Favorites'}
  ];

  int selectedPageIndex = 0;

  void _selectPage(int index){
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: pages[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        unselectedItemColor: Colors.white ,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [BottomNavigationBarItem(backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category), title: Text('Categories')),
          BottomNavigationBarItem(backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star), title: Text('Favorites')
          )
        ],
      ),
    );
  }
}


//    return DefaultTabController(
//      length: 2,
//      child: Scaffold(
//        appBar: AppBar(
//          title: Text('Meals'),
//          bottom: TabBar(tabs: [
//            Tab(
//              icon: Icon(Icons.category),
//              text: 'Categories',
//            ),
//            Tab(
//              icon: Icon(Icons.star),
//              text: 'Favorites',
//            )
//          ]),
//        ),
//        body: TabBarView(children: [CategoryScreen(), FavoritesScreen()]),
//      ),
//    );
