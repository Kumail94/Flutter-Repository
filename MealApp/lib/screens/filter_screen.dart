import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters-meal';
  final Map<String, bool> _currentFilters;
  final Function _setFilters;
  FiltersScreen(this._currentFilters, this._setFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactosFree = false;

  @override
  void initState() {
    _glutenFree = widget._currentFilters['gluten'];
    _lactosFree = widget._currentFilters['lactose'];
    _vegan = widget._currentFilters['vegen'];
    _vegetarian = widget._currentFilters['vegetarian'];
    super.initState();
  }

  Widget _buildSwitchListTitle(
    String listTitle,
    String description,
    bool currenValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(listTitle),
      value: currenValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your-Filter'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactosFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget._setFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child:
                Text("The Filters!", style: Theme.of(context).textTheme.title),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTitle(
                  'Gluten-Free',
                  'Only include gluten free meals',
                  _glutenFree,
                  (onValue) {
                    setState(
                      () {
                        _glutenFree = onValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTitle(
                  'Gluten-Free',
                  'Only include vegantarian meals',
                  _vegetarian,
                  (onValue) {
                    setState(
                      () {
                        _vegetarian = onValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTitle(
                  'Vegan',
                  'Only include vegan meals',
                  _vegan,
                  (onValue) {
                    setState(
                      () {
                        _vegan = onValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTitle(
                  'Lactose-Free',
                  'Only include lactose free meals',
                  _lactosFree,
                  (onValue) {
                    setState(
                      () {
                        _lactosFree = onValue;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
