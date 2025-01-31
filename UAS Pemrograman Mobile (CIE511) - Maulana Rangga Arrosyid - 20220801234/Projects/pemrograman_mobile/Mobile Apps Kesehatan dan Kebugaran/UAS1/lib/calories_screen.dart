import 'package:flutter/material.dart';

class KaloriScreen extends StatefulWidget {
  @override
  _KaloriScreenState createState() => _KaloriScreenState();
}

class _KaloriScreenState extends State<KaloriScreen> {
  final _formKey = GlobalKey<FormState>();
  String _kalori;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalori'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Masukkan kalori harian',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Kalori harian tidak boleh kosong';
                  }
                  return null;
                },
                onSaved: (value) => _kalori = value,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    // Simpan data kalori ke database atau API
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Kalori harian tersimpan')),
                    );
                  }
                },
                child: Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}