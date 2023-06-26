

import 'package:flutter/material.dart';

InputDecoration myInputDecoretion(label){
  return InputDecoration(
    hintText: "Title",
    fillColor: Colors.white70,
    filled: true,
    labelText: label,
    border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.greenAccent)
    ),
  );
}

