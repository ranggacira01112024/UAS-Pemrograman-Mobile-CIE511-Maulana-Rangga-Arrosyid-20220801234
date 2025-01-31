import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AktivitasScreen extends StatefulWidget {
  @override
  _AktivitasScreenState createState() => _AktivitasScreenState();
}

class _AktivitasScreenState extends State<AktivitasScreen> {
  final _formKey = GlobalKey<FormState>();
  String _aktivitas;

  Future<void> _submitAktivitas() async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/aktivitas'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'aktivitas': _aktivitas}),
    );
    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Aktivitas berhasil ditambahkan')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal menambahkan aktivitas')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aktivitas - DJI Smart Health'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Masukkan aktivitas',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Aktivitas tidak boleh kosong';
                  }
                  return null;
                },
                onSaved: (value) => _aktivitas = value,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitAktivitas,
                child: Text('Simpan Aktivitas'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}