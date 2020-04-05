

import 'package:aniplex/shared/navigation.dart';
import 'package:aniplex/shared/search.dart';
import 'package:aniplex/ui/login.dart';
import 'package:aniplex/ui/login.v2.dart';
import 'package:ant_icons/ant_icons.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jikan_dart/jikan_dart.dart';

Widget profileBody() {
  return Scaffold(
    backgroundColor: Colors.grey[900],
    body: Padding(
      padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              GFAvatar(
                backgroundImage: AssetImage('assets/ninja.png'),
                radius: 30.0,
              ),
              SizedBox(
                width: 20.0,
              ),
              Text(
                'NAME:',
                style: TextStyle(color: Colors.grey, letterSpacing: 2.0),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                'Chun-Li',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: <Widget>[
              Text(
                'CURRENT NINJA LEVEL:',
                style: TextStyle(color: Colors.grey, letterSpacing: 2.0),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                '8',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            children: <Widget>[
              Icon(
                Icons.email,
                color: Colors.grey[400],
              ),
              SizedBox(width: 10.0),
              Text(
                'chun.li@thenetninja.co.uk',
                style: TextStyle(
                  color: Colors.grey[300],
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

final String source = 'MAL';
final String animeName = 'Black Clover';
final String time = '04-03-20';

Widget masterFlow() {
 return ListView.builder(
     itemCount: 50,
     itemBuilder: (context, index){
   return Padding(
     padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
     child: GFListTile(
       description: Text('Source:' + source),
         avatar: Image.network('https://cdn.myanimelist.net/r/100x140/images/anime/2/88336.webp?s=73a7bc3902e9183843cc22abf006485e'),
         title: Text(animeName),
         color: Colors.grey[850],
         subtitleText:time,
         icon: Icon(AntIcons.star_outline),
     ),

     /*Card(
       elevation: 10,
       color: Colors.grey[850],
       child: Container(
         decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),), //color: Colors.white),
         child: Row(
           crossAxisAlignment: CrossAxisAlignment.center,
           //mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: <Widget>[
             GFAvatar(
               backgroundImage: NetworkImage('https://cdn.myanimelist.net/r/100x140/images/anime/2/88336.webp?s=73a7bc3902e9183843cc22abf006485e'),
               backgroundColor: Colors.black,
               shape: GFAvatarShape.standard,
               size: 65,
             ),
             Expanded(
               child: Padding(
                 padding: const EdgeInsets.all(5.0),
                 child: ListTile(
                   title: Text('Black Clover'),
                   subtitle: Text('03-02-20'),
                   trailing: Text('128/???'),

                 ),
               ),
             ),
           ],
         ),
       ),
     ),*/
   );
 });
}
//Color(0xFF2d3447)

final String AppIconUrl = 'https://dartpad.dartlang.org/dart-192.png';
final String AppIconAsset = 'assets/dart.png';

class MyFlurry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyFlurt(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyFlurt extends StatefulWidget {
  MyFlurt({Key key}) : super(key: key);

  @override
  _MyFlurtState createState() => _MyFlurtState();
}

class _MyFlurtState extends State<MyFlurt> with TickerProviderStateMixin{
  final GlobalKey<ScaffoldState> _flurtKey = new GlobalKey<ScaffoldState>();

  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Widget customDrawBar() {
    return GFDrawer(
      color: Colors.grey[900],
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          GFDrawerHeader(
            closeButton: IconButton(
              icon: Icon(
                AntIcons.fullscreen_exit,
                color: Colors.grey,
                size: 20.0,
              ),
              onPressed: () {
                _flurtKey.currentState.openEndDrawer();
              },
            ),
            currentAccountPicture: GFAvatar(
              radius: 80.0,
              backgroundImage: AssetImage('assets/appIcon.png'),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(username),
                Text(email),
              ],
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.bottomCenter,
                  colors: [Colors.grey[900], Colors.grey[800]]),
            ),
          ),
          ListTile(
            title: Text('Login'),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => Login()));
            },
          ),
          ListTile(
            title: Text('Settings'),
            onTap: (){
              
            },
          ),
        ],
      ),
    );
  }

  Widget customABar() {
    return GFAppBar(
      bottom: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        controller: tabController,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey,
        indicatorColor: Colors.grey[500],
        tabs: [
          Tab(
            //text: 'Anime',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(AntIcons.play_circle_outline),
                SizedBox(width: 10,),
                Text('Anime')
              ],
            ),
          ),
          Tab(
            //text: 'Manga',
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               Icon(AntIcons.book_outline),
               SizedBox(width: 10,),
               Text('Manga'),
             ],
           ),
          ),
        ],
      ),
      title: Text(
        'Ani-Plex',
        style: GoogleFonts.portLligatSans(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
          color: Colors.white,
        ),
      ),
      leading: GFIconButton(
          icon: Icon(
            AntIcons.menu_fold,
            color: Colors.white,
          ),
          color: Colors.transparent,
          onPressed: () {
            _flurtKey.currentState.openDrawer();
          }),
      searchBar: false,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: Icon(AntIcons.star_outline),
        )
      ],
      backgroundColor: Colors.grey[850],
      elevation: 0.0,
      centerTitle: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _flurtKey,
      appBar: customABar(),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
        masterFlow(),
          Center(child: Text('Manga Goes Here!!'),
          ),
      ],

      ),//masterFlow(),
      drawer: customDrawBar(),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            AntIcons.search_outline,
            size: 25,
          ),
          backgroundColor: Colors.grey[800],
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) {
                  return SearchBar();
                }

            ));
          }),
      backgroundColor: Colors.grey[900],
    );
  }
}

/*
++notes:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Container changes the size to wrap whats in it.
- except when it is empty.. it then takes as much space as possible.
- it allows to add padding and margin.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Row allows for multiple widgets to be stored Horizontally.
- MainAxisAlignment can be used to customize the row item's spacing etc. horizontally.
- CrossAxis does similar for vertical.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Columns allows for multiple widgets  to be stored Vertically.
- MainAxis and CrossAxis function the same as Row but are inverted.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Expanded allows to make its child to 'expand' or fit to screen.
- Flex splits the expanded space into fractions and determines how much each gets.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# SizedBox allows to put a small box of height,width,child etc.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# SafeArea protects contents from going off screen and notch

*/
