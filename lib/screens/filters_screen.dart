import 'package:flutter/material.dart';
import 'package:food_app/screens/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filter-screen';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool glutenFree = false;
  bool vegetarian = false;
  bool vegan = false;
  bool lactoseFree = false;

  Widget buildLlistTile(String title, String description, bool currentValue,
      Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjust your meal selection",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  buildLlistTile(
                      'Gluten-free',
                      'Only include gluten-free meals',
                      glutenFree,
                      (newValue) {
                        setState(() {
                          glutenFree = newValue;
                        });
                      }),
                  buildLlistTile(
                      'Lactose-free',
                      'Only include lactose-free meals',
                      lactoseFree,
                          (newValue) {
                        setState(() {
                          lactoseFree = newValue;
                        });
                      }),
                  buildLlistTile(
                      'Vegetarian',
                      'Only include vegetarian meals',
                      vegetarian,
                          (newValue) {
                       setState(() {
                         vegetarian = newValue;
                       });
                      }),
                  buildLlistTile(
                      'Vegan',
                      'Only include vegan meals',
                      vegan,
                          (newValue) {
                        setState(() {
                          vegan = newValue;
                        });
                      }),

                ],
              ),
            )
          ],
        ));
  }
}
