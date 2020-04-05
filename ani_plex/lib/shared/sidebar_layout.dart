import 'package:aniplex/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:aniplex/shared/homepage.dart';
import 'package:aniplex/shared/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SideBarLayout extends StatelessWidget {
  SideBarLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(),
        child: Stack(
          children: <Widget>[
            BlocBuilder<NavigationBloc, NavigationStates>(
                builder: (context,navigationState){
                  return navigationState as Widget;
                },
            ),
            SideBar(),
          ],
        ),
      ),
    );
  }
}
