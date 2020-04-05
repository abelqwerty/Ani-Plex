import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';

class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

final String username = 'Shemar Abel';
final String email = 'shemar268abel@gmail.com';
final String profileImage = 'https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg';
final String backGround = 'https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg';

Widget customDrawer (){
  return GFDrawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        GFDrawerHeader(
          decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.bottomCenter,
        colors: [Color(0xffda1f28), Colors.deepOrange,]),
        ),
          currentAccountPicture: GFAvatar(
            radius: 80.0,
            backgroundImage: NetworkImage(profileImage),
            backgroundColor: Colors.deepOrange,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(username),
              Text(email),
            ],
          ),
        ),
        InkWell(
          child: GFListTile(
            titleText: 'Notification',
            avatar: Icon(Icons.notifications_active),
            description: Text('View Notifications here'),
            color: Colors.transparent,
          ),
          onTap: (){},
        ),
        ListTile(
          title: Text('Item'),
          onTap: null,
        ),
        ListTile(
          title: Text('Item 2'),
          onTap: null,
        ),
      ],
    ),
    gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.topRight,
        colors: [Colors.deepOrange, Colors.pinkAccent]),
  );
}


class _MyScreenState extends State<MyScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  Widget customAppBar (){
    return GFAppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(0),
        ),
      ),
      backgroundColor: Color(0xffda1f28),
      leading: GFIconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        onPressed: () {
          _scaffoldKey.currentState.openDrawer();
        },
        type: GFButtonType.transparent,
      ),
      searchBar: true,
      onTap: (){

      },
      primary: true,
      title: Text("Ani-Plex"),
      actions: <Widget>[
        GFIconButton(
          icon: Icon(
            Icons.favorite,
            color: Colors.white,
          ),
          onPressed: () {

          },
          type: GFButtonType.transparent,
        ),
      ],
    );
  }
  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];
  Widget wtF (){
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index){
          return Padding(
            child: GFCarousel(
              items: imageList.map(
                    (url) {
                  return Container(
                    margin: EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: Image.network(
                          url,
                          fit: BoxFit.cover,
                          width: 1000.0
                      ),
                    ),
                  );
                },
              ).toList(),
              onPageChanged: (index) {
                setState(() {
                  index;
                });
              },
            ),
          padding: EdgeInsets.all(8.0),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
      drawer: customDrawer(),
      appBar: customAppBar(),
      body: Scaffold(
          body: Center(
              child: wtF()
          )
      ),

      );
  }
}
