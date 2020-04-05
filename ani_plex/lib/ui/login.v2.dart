import 'package:aniplex/ui/home_model.dart';
import 'package:aniplex/ui/text_field_widget.dart';
import 'package:aniplex/ui/wave_widget.dart';
import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'button_widget.dart';

class Loginv2 extends StatelessWidget {
  Loginv2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

   return Scaffold(
     backgroundColor: Colors.blue,
     body: Stack(
       children: <Widget>[
         Container(
           height: size.height -200,
           color: Colors.blue,
         ),
         AnimatedPositioned(
           duration: Duration(milliseconds: 0),
           curve: Curves.easeOutQuad,
           top: keyboardOpen ? - size.height /3.7 : 0.0,
           child: WaveWidget(
             size: size,
             yOffset: size.height /3.0,
             color: Colors.white,
           ),
         ),
         Padding(
           padding: const EdgeInsets.all(30.0),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.end,
             children: <Widget>[
               TextFieldWidget(
                 hintText: 'Email',
                 obscureText: false,
                 prefixIconData: AntIcons.mail_outline,
                 suffixIconData: AntIcons.check_outline,
                 onChanged: (value){
                 },
               ),
               SizedBox(height: 10,),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.end,
                 children: <Widget>[
                   TextFieldWidget(
                     hintText: 'Password',
                     obscureText: true,
                     prefixIconData: AntIcons.lock_outline,
                   ),
                   SizedBox(height: 5,),
                   Text('Forgot password?'.toUpperCase(),
                   style: TextStyle(
                     color: Colors.blue[500],
                     fontSize: 12
                   ),
                   ),
                 ],
               ),
               SizedBox(height: 10,),
               ButtonWidget(
                 title: 'Login',
                 hasBorder: false,
               ),
               SizedBox(height: 10,),
               ButtonWidget(
                 title: 'SignUp',
                 hasBorder: true,
               ),
             ],
           ),
         ),
       ],
     ),
   );
  }
}

