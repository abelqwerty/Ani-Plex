import 'package:aniplex/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget with NavigationStates{
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          'My HomePage',
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
        ),
      ),
    );
  }
}
