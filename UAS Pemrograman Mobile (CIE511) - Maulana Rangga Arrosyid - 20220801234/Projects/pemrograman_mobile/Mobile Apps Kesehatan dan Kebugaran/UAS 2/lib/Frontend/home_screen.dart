import 'package:flutter/material.dart';
import 'package:dji_smart_health/aktivitas_screen.dart';
import 'package:dji_smart_health/kalori_screen.dart';
import 'package:dji_smart_health/olahraga_screen.dart';
import 'package:dji_smart_health/kesehatan_screen.dart';
import 'package:dji_smart_health/login_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    AktivitasScreen(),
    KaloriScreen(),
    OlahragaScreen(),
    KesehatanScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DJI Smart Health'),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.directions_walk), label: 'Aktivitas'),
          BottomNavigationBarItem(icon: Icon(Icons.food_bank), label: 'Kalori'),
          BottomNavigationBarItem(icon: Icon(Icons.sports_gymnastics), label: 'Olahraga'),
          BottomNavigationBarItem(icon: Icon(Icons.health_and_safety), label: 'Kesehatan'),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Login'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

