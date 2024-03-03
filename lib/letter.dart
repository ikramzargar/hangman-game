import 'package:flutter/material.dart';

Widget letter (String character, bool isHidden){
  return Container(
    height: 65,
    width: 50,
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(4),
    ),
    child: Visibility(
      visible: !isHidden,
        child: Text(
          character,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
    ),
  );
}