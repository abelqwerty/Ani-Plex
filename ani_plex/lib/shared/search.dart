import 'package:aniplex/ui/flurry.dart';
import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';

import 'package:getflutter/getflutter.dart';

List list = [
  "Flutter",
  "React",
  "Ionic",
  "Xamarin",
];

class SearchBar extends StatefulWidget {
  SearchBar({Key key}) : super(key: key);

  @override
  _SearchBarState createState() {
    return _SearchBarState();
  }
}

class _SearchBarState extends State<SearchBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[900],
      child: SafeArea(
        child: GFSearchBar(
          searchBoxInputDecoration: InputDecoration(
            prefixIcon: GFIconButton(
              icon: Icon(Icons.arrow_back),
              type: GFButtonType.transparent,
              onPressed: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
                  return MyFlurry();
                }));
              },
              ),
            labelText: 'Search',
            labelStyle: TextStyle(color: Colors.white),
            hintText: 'Enter anime name here',
            hintStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
          ),
          noItemsFoundWidget: Center(
            child: Text('Error Search Item Not Found'),
          ),
          searchList: list,
          searchQueryBuilder: (query, list) {
            return list
                .where((item) =>
                item.toLowerCase().contains(query.toLowerCase()))
                .toList();
          },
          overlaySearchListItemBuilder: (item) {
            return Container(
              padding: const EdgeInsets.all(8),
              child: Text(
                item,
                style: const TextStyle(fontSize: 18),
              ),
            );
          },
          onItemSelected: (item) {
            setState(() {
              print('$item');
            });
          },
        ),
      ),
    );
  }
}