import 'package:flutter/material.dart';

class KesehatanScreen extends StatefulWidget {
  @override
  _KesehatanScreenState createState() => _KesehatanScreenState();
}

class _KesehatanScreenState extends State<KesehatanScreen> {
  final _formKey = GlobalKey<FormState>();
  String _tekananDarah;
  String _gulaDarah;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kesehatan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Tekanan darah',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Tekanan darah tidak boleh kosong';
                  }
                  return null;
                },
                onSaved: (value) => _tekananDarah = value,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Gula darah',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Gula darah tidak boleh kosong';
                  }
                  return null;
                },
                onSaved: (value) => _gulaDarah = value,
              ),
              SizedBox(height: 16
