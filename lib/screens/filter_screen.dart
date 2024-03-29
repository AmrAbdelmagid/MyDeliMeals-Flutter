import 'package:flutter/material.dart';
import 'package:my_delimeal/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter-screen';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FilterScreen(this.currentFilters,this.saveFilters);


  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState(){
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }

  Widget _buildSwitchTile(
    String title,
    String description,
    bool currentVal,
    Function updateVal,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentVal,
      subtitle: Text(description),
      onChanged: updateVal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meals',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchTile(
                  'Gluten-free',
                  'Only include gluten-free meals.',
                  _glutenFree,
                      (newValue) {
                    setState(
                          () {
                        _glutenFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchTile(
                  'Vegetarian',
                  'Only include vegetarian meals.',
                  _vegetarian,
                      (newValue) {
                    setState(
                          () {
                        _vegetarian = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchTile(
                  'Lactose-free',
                  'Only include lactose-free meals.',
                  _lactoseFree,
                      (newValue) {
                    setState(
                          () {
                        _lactoseFree = newValue;
                      },
                    );
                  },
                ),

                _buildSwitchTile(
                  'Vegan',
                  'Only include vegan meals.',
                  _vegan,
                      (newValue) {
                    setState(
                          () {
                        _vegan = newValue;
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
