import 'package:flutter/material.dart';
import 'airplane_list_page.dart';

void main() {
  runApp(CAFR());
}
//author Muhammed Ozturk
class CAFR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CAFR',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/airplanes': (context) => AirplaneListPage(),
        // Add routes for other parts if needed
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CAFR Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/airplanes');
              },
              child: Text('Airplane List'),
            ),
            // Add buttons for other parts if needed
          ],
        ),
      ),
    );
  }
}
