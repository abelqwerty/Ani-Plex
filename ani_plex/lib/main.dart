import 'dart:async';

import 'package:aniplex/shared/sidebar_layout.dart';
import 'package:aniplex/ui/flurry.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatefulWidget {
  Splash({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {

  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => MyFlurry())));
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'A',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          children: [
            TextSpan(
              text: 'NI',
              style: TextStyle(color: Colors.deepOrange, fontSize: 30),
            ),
            TextSpan(
              text: '-P',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            TextSpan(
              text: 'LEX',
              style: TextStyle(color: Colors.deepOrange, fontSize: 30),
            ),
          ]),
    );
  }

  Widget _smile() {
    return Transform.rotate(angle: 55, child: RichText(text: TextSpan(text: '(', style: TextStyle(fontSize: 60, color: Colors.deepOrange)),),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff00498D),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height,
              //comment out to make it look cooler
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.shade200,
                        offset: Offset(2, 4),
                        blurRadius: 5,
                        spreadRadius: 2)
                  ],
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.bottomCenter,
                      colors:[Colors.grey[900], Colors.grey[800]])), //[Color(0xff00498D), Color(0xff0052A2)]
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  _title(),
                  _smile(),
                  SizedBox(
                    //change to 80 to make it look cooler
                    height: 10,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                    //put image rii here,
                  ),
                  //remove comment to see maker
                  /*Text('Created by Abel-S',
                textAlign: TextAlign.center,),*/
                ],
              ),
            ),
            //put something here for decoration purpose
          ],),),
    );
  }
}


void main() => runApp(MaterialApp(
title: 'Ani-Plex',
home: Splash(),
  debugShowCheckedModeBanner: false,
));