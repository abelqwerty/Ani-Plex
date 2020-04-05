import 'package:aniplex/ui/flurry.dart';
import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:getflutter/shape/gf_icon_button_shape.dart';
import 'package:google_fonts/google_fonts.dart';

final emailField = TextField(
  obscureText: false,
  style: TextStyle(
    letterSpacing: 2.0,
  ),
  decoration: InputDecoration(
    labelText: 'Email',
    hintText: 'Enter email here',
    prefixIcon: Icon(AntIcons.mail),
    //errorText: 'Email is Invalid',
    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
  ),
);
final passwordField = TextField(
  obscureText: true,
  style: TextStyle(
    letterSpacing: 2.0,
  ),
  decoration: InputDecoration(
    labelText: 'Password',
    hintText: 'Enter password here',
    prefixIcon: Icon(AntIcons.lock),
   // errorText: 'Password doesnt meet criteria',
    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
  ),
);

Widget loginButton(){
  return GFButton(
      text: 'Login',
      shape: GFButtonShape.pills,
      color: Colors.grey[850],
      highlightColor: Colors.black,
      fullWidthButton: true,
      onPressed: (){}
      );
}

Widget googleButton(){
  return GFIconButton(
      icon: Icon(AntIcons.google_circle),
      color: Colors.red[900],
      shape: GFIconButtonShape.standard,
      size: 35,
      onPressed: (){},
  );
}

Widget facebookButton(){
  return GFIconButton(
      icon: Icon(AntIcons.facebook_outline),
      color: Colors.blueAccent,
      shape: GFIconButtonShape.standard,
      size: 35,
      onPressed: (){},
  );
}

Widget disclaimer(){
  return Text('The information you submit must be accurate user information. Your information shall not me used in any harmful way or form and is only used in this application.');
}

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey <ScaffoldState> _logKey = new GlobalKey<ScaffoldState>();
  bool log = true;

  Widget appY (){
    return GFAppBar(
      backgroundColor: Colors.grey[900],
      elevation: 0,
      leading: GFIconButton(
          color: Colors.black,
          icon: Icon(AntIcons.rollback),
          onPressed: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => MyFlurry()));
          }),
      actions: <Widget>[
        GFIconButton(
            color: Colors.black,
            icon: Icon(AntIcons.highlight_outline),
            onPressed: (){
              log = !log;
              setState(() {
              });
            })
      ],
      title: Text(
        'Login',
        style: GoogleFonts.arvo(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
          decoration: TextDecoration.underline,
          color: Colors.grey,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _logKey,
      appBar: appY(),
      backgroundColor: log ? Colors.grey[900] : Colors.white,
      body: Center(
        child: Form(child: Padding(
          padding: const EdgeInsets.all(38.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: disclaimer(),
              ),
              SizedBox(height: 75,),
              emailField,
              SizedBox(height: 25,),
              passwordField,
              SizedBox(height: 35,),
              loginButton(),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  googleButton(),
                  SizedBox(width: 25,),
                  facebookButton(),
                ],
              ),
            ],
          ),
        ),

        ),
      ),
    );
  }
}

