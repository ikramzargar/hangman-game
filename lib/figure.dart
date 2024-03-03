import'package:flutter/material.dart';

Widget figure(bool isVisible, String path){
  return Visibility(
      visible: isVisible,
      child: Container(
        width: 250,
        height: 250,
        child: Image.asset(path),
      ),

  );
}