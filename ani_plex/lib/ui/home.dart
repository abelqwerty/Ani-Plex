import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getflutter/getflutter.dart';


List slist = [
  "Flutter",
  "React",
  "Ionic",
  "Xamarin",
];

Widget _searchBar (){
  return GFSearchBar(
      searchList: slist,
    searchQueryBuilder: (query, list){
        return list
            .where((item) =>
        item.toLowerCase().contains(query.toLowerCase()))
            .toList();
    },
    overlaySearchListItemBuilder: (item){
        return Container(
          padding: const EdgeInsets.all(8),
          child: Text(item, style: const TextStyle(fontSize: 18),
          ),
        );
    },
    onItemSelected: (item){
          print('$item');
    },
      );
}


final List<String> imageList = [
  "https://p9h8s7b7.stackpathcdn.com/wp-content/uploads/2015/03/minimalist-star-wars-icons-7.jpg",
  "https://p9h8s7b7.stackpathcdn.com/wp-content/uploads/2015/03/minimalist-star-wars-icons-6.jpg",
  "https://p9h8s7b7.stackpathcdn.com/wp-content/uploads/2015/03/minimalist-star-wars-icons-4.jpg",
];

class bottomBar extends StatefulWidget {
  @override
  _bottomBarState createState() => _bottomBarState();
}

class _bottomBarState extends State<bottomBar> {
  var _showFab = true;
  var _showNotch = true;
  var _fabLocation = FloatingActionButtonLocation.centerDocked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar codes
      appBar: AppBar(
        elevation: 10.0,
        backgroundColor: Color(0xffda1f28),
        leading: 
        GFAvatar(
          backgroundColor: Colors.transparent,
          child: GFImageOverlay(
            height: 40,
            width: 40,
            shape: BoxShape.circle,
            image: NetworkImage('https://p9h8s7b7.stackpathcdn.com/wp-content/uploads/2015/03/minimalist-star-wars-icons-7.jpg'),
          ),
        ),
        //IconButton(icon: Icon(Icons.account_circle,size: 25,), onPressed: () {},),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {},),
          ],
        title: Text('Ani-Plex'),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Color(0xff760c10), width: 2.0, style: BorderStyle.solid),
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
      ),
backgroundColor: Color(0xff17141E),
      //Column || Row || etc goes here.
      body: PageView.builder(itemBuilder: (context, position){
        return Scaffold(
          body: Row(
            children: <Widget> [
              Expanded(
                child: Container(
                color:  position % 2 == 0 ? Colors.pink : Colors.blue,
                child: GridView.count(crossAxisCount: 1,
                children:
                <Widget>[
                  Container(
                    child: GFCarousel(items: imageList.map(
                      (url){
                      return Container(
                      margin: EdgeInsets.all(5.0),
                    child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: Image.network(
                        url,
                        fit: BoxFit.fitWidth,
                        width: 1000.0,
                      ),
                    ),
                      );
            },).toList(),
                    viewportFraction: 1.0,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 10),
                    enlargeMainPage: false,
                    pauseAutoPlayOnTouch: Duration(seconds: 2),
                    pagerSize: 5,
                    pagination: true,

                    onPageChanged: (index) {
                      setState(() {
                        index;
                      });
                    },),
                  ),


                ],

                    physics: BouncingScrollPhysics(),
                ),
            ),
              ),
          ],),
        );
      }, itemCount: 2,
      ),
      extendBodyBehindAppBar: false,

      //bottomBar code
      floatingActionButton: _showFab
          ? FloatingActionButton(
          onPressed: () {
            print('Floating action button pressed');
          },
          backgroundColor: Colors.red,
          child: Icon(Icons.whatshot),
          tooltip: 'News'
      )
          : null,
      floatingActionButtonLocation: _fabLocation,
      bottomNavigationBar: _bottomBar(
        fabLocation: _fabLocation,
        shape: _showNotch ? CircularNotchedRectangle() : null,
      ),
    );
  }
}


class _bottomBar extends StatelessWidget {
  const _bottomBar({
    this.fabLocation,
  this.shape});

  final FloatingActionButtonLocation fabLocation;
  final NotchedShape shape;

  static final centerLocations = <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color(0xffda1f28),
      shape: shape,
      elevation: 5,
      child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Row(
            children: <Widget>[
              IconButton(
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                icon: const Icon(Icons.menu, size: 25,),
                onPressed: () {
                  print('Menu button pressed');
                },
              ),
              if (centerLocations.contains(fabLocation)) const Spacer(),
              IconButton(
                tooltip:
                'Anime',
                icon: const Icon(Icons.play_circle_filled, size: 25,),
                onPressed: () {
                  print('Anime button pressed');
                },
              ),
              IconButton(
                tooltip:
                'Favorite',
                icon: const Icon(Icons.favorite, size: 25,),
                onPressed: () {
                  print('Favorite button pressed');
                },
              ),
              IconButton(
                tooltip:
                'Manga',
                icon: const Icon(Icons.chrome_reader_mode, size: 25,),
                onPressed: () {
                  print('Manga button pressed');
                },
              ),
            ],
          ),
      ),
    );
  }
}