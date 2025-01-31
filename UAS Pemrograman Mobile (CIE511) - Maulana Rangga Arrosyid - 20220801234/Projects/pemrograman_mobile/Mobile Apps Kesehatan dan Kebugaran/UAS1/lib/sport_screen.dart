import 'package:flutter/material.dart';

class OlahragaScreen extends StatefulWidget {
  @override
  _OlahragaScreenState createState() => _OlahragaScreenState();
}

class _OlahragaScreenState extends State<OlahragaScreen> {
  final _olahraga = [
    'Lari',
    'Bersepeda',
    'Berenang',
    'Yoga',
    'Angkat besi',
  ];

  String _selectedOlahraga;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Olahraga'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField(
              decoration: InputDecoration(
                labelText: 'Pilih olahraga',
                border: OutlineInputBorder(),
              ),
              items: _olahraga.map((olahraga) {
                return DropdownMenuItem(
                  child: Text(olahraga),
                  value: olahraga,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedOlahraga = value;
                });
              },
              value: _selectedOlahraga,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Simpan data olahraga ke database atau API
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Olahraga tersimpan')),
                );
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
