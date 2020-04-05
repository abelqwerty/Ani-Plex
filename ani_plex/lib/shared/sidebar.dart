import 'dart:async';

import 'package:aniplex/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:aniplex/shared/menu.dart';
import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getflutter/getflutter.dart';
import 'package:rxdart/rxdart.dart';

class SideBar extends StatefulWidget {
  SideBar({Key key}) : super(key: key);

  @override
  _SideBarState createState() {
    return _SideBarState();
  }
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar>{
  AnimationController _animationController;
  StreamController<bool> isSideBarOpenedStreamController;
  Stream<bool> isSideBarOpenedStream;
  StreamSink<bool> isSideBarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _animationDuration);
    isSideBarOpenedStreamController = PublishSubject<bool>();
    isSideBarOpenedStream = isSideBarOpenedStreamController.stream;
    isSideBarOpenedSink = isSideBarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSideBarOpenedStreamController.close();
    isSideBarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed (){
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if(isAnimationCompleted){
      isSideBarOpenedSink.add(false);
      _animationController.reverse();
    }else {
      isSideBarOpenedSink.add(true);
      _animationController.forward();
    }
  }


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSideBarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data ? 0 : 0 - screenWidth,
          right: isSideBarOpenedAsync.data ? 0 : screenWidth - 45,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  color: Color(0xFF262AAA),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 80,),
                      GFListTile(
                        title: Text('Shemar Abel', style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,),
                        ),
                        subTitle: Text('shemar268abel@gmail.com', style: TextStyle(
                          color: Color(0xFF1BB5FD),fontSize: 15,
                        ),
                        ),
                        avatar: GFAvatar(
                          backgroundImage: AssetImage('assets/appIcon.png'),
                          radius: 30,
                          shape: GFAvatarShape.circle,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: <Widget>[
                        Divider(
                        color: Colors.white,
                        height: 12,
                        thickness: 0,
                        indent: 12,
                        endIndent: 12,
                      ),
                      MenuItem(
                        icon: AntIcons.home_outline,
                        title: 'HomePage',
                        onTap: (){
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickedEvent);
                        },
                      ),
                      MenuItem(
                        icon: AntIcons.play_circle_outline,
                        title: 'Anime',
                      ),
                      MenuItem(
                        icon: AntIcons.book_outline,
                        title: 'Manga',
                      ),
                      MenuItem(
                        icon: AntIcons.login,
                        title: 'Login',
                      ),

                      Divider(
                        color: Colors.white,
                        height: 12,
                        thickness: 0,
                        indent: 12,
                        endIndent: 12,
                      ),
                      MenuItem(
                        icon: AntIcons.setting_outline,
                        title: 'Settings',
                      ),
                      MenuItem(
                        icon: AntIcons.logout_outline,
                        title: 'LogOut',
                      ),]),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0,-0.9),
                child: GestureDetector(
                  onTap: (){
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: 35,
                      height: 110,
                      color: Color(0xFF262AAA),
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Color(0xFF1BB5FD),
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width-1, height/2 - 20, width, height/2);
    path.quadraticBezierTo(width +1, height/2 + 20, 10, height-16);
    path.quadraticBezierTo(0, height - 8, 0, height);


    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}