import 'package:flutter/material.dart';
import 'package:dji_smart_health/presentation/pages/secondpage.dart';

void navigateToSecondPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => SecondPage(),
    ),
  );
}