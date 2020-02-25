import 'package:flutter/material.dart';
import 'package:food_app/screens/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filter-screen';

  final Function saveFilters;
  final Map<String, bool> filters;

  FiltersScreen(this.saveFilters, this.filters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool glutenFree = false;
  bool vegetarian = false;
  bool vegan = false;
  bool lactoseFree = false;


  //init state is used to initialize variables within a stateful widget
  @override
  void initState() {
    glutenFree = widget.filters['gluten'];
    lactoseFree = widget.filters['lactose'];
    vegan = widget.filters['vegan'];
    vegetarian = widget.filters['vegetarian'];

    super.initState();
  }

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
          actions: <Widget>[
            //widget.saveFilters is referring to the function variable in a different class
            IconButton(icon: Icon(Icons.save), onPressed:() {
              final selectedFilters = {
                'gluten': glutenFree,
                'lactose': lactoseFree,
                'vegan': vegan,
                'vegetarian':vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },)
              ],
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
