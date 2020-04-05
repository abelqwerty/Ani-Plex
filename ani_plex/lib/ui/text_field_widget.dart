import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData prefixIconData;
  final IconData suffixIconData;
  final bool obscureText;
  final Function onChanged;

  TextFieldWidget({
      this.hintText,
      this.prefixIconData,
      this.suffixIconData,
      this.obscureText,
      this.onChanged
});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      onChanged: onChanged,
      style: TextStyle(
        color: Colors.blue[500],
        fontSize: 14.0,
      ),
      cursorColor: Colors.blue[500],
      decoration: InputDecoration(
        labelText: hintText,
        prefixIcon: Icon(prefixIconData,
        size: 18,
        color: Colors.blue[500],
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue[500]),
        ),
        filled: true,
        suffixIcon: Icon(suffixIconData,
        size: 18,
        color: Colors.blue[500],
        ),
        labelStyle: TextStyle(color: Colors.blue[500]),
        focusColor: Colors.blue[500],
      ),
    );
  }
}
