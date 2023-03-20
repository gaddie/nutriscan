import 'package:flutter/material.dart';

const kMainColor = Color(0xffFC7300);
const kTextColor = Color(0xff03C988);
const kHelpText = Text(
  "To get started, simply enter the name of the food or fruit you want to learn about in the search bar at the top of the screen. You can enter the name of any food or fruit, such as 'banana,' 'salmon,' or 'chicken breast.'Once you've entered the name of the food or fruit, press the 'Search' button to see the nutritional information for that item. The app will display the nutritional values of the food or fruit entered . We hope you find our app useful for learning more about the nutritional values of your favorite foods and fruits!",
  style: TextStyle(fontSize: 15.0),
);

const kGreenColor = Color(0xffBFDB38);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xffFC7300), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xffFC7300), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
