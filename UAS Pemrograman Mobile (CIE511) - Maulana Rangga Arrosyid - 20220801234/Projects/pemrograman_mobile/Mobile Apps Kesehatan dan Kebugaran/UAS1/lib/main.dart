import 'package:flutter/material.dart';
import 'package:dji_smart_health/home_screen.dart';

void main() {
runApp(MyApp());
}

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'DJI Smart Health',
theme: ThemeData(
primarySwatch: Colors.blue,
),
home: HomeScreen(),
);
}
}
