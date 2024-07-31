import 'package:flutter/material.dart';
import 'airplane_list_page.dart';
// Import other pages for Customer, Flight, and Reservation when they are ready.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CAFR App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CAFR App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AirplaneListPage()),
                );
              },
              child: Text('Airplanes'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to Customer page when ready
              },
              child: Text('Customer'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to Flight page when ready
              },
              child: Text('Flight'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to Reservation page when ready
              },
              child: Text('Reservation'),
            ),
          ],
        ),
      ),
    );
  }
}
