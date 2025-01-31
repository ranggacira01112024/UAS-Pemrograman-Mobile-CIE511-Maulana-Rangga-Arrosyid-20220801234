import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserHomeScreen extends StatefulWidget {
  @override
  _UserHomeScreenState createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  Future<List<dynamic>> _getAktivitas() async {
    final response = await http.get(
      Uri.parse('http://localhost:3000/aktivitas/user'),
      headers: {
        'x-access-token': 'user-token',
      },
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData;
    } else {
      throw Exception('Gagal mengambil data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DJI Smart Health User Home Screen'),
      ),
      body: FutureBuilder(
        future: _getAktivitas(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data[index]['aktivitas']),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Gagal mengambil data'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}