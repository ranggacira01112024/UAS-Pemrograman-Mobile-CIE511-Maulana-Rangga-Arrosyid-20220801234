// ...

Future<void> _login() async {
  final response = await http.post(
    Uri.parse('http://localhost:3000/login'),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({'email': _email, 'password': _password}),
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    if (jsonData['role'] == 'admin') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AdminHomeScreen()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UserHomeScreen()),
      );
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Invalid email or password')),
    );
  }
}

// ...
