
import 'package:flutter/material.dart';
import 'package:dji_smart_health/domain/usecases/navigate_to_second_page.dart';
import 'package:dji_smart_health/presentation/pages/secondpage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DJI Smart Health'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to DJI Smart Health'),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Call use case to navigate to second page
                navigateToSecondPage(context);
              },
              child: Text('Go to Second Page'),
            ),
          ],
        ),
      ),
    );
  }
}
