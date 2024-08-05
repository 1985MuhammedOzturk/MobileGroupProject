import 'package:flutter/material.dart';
import 'new_flight_page.dart';
import 'airplane_list_page.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
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

              },
              child: Text('Customer'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewFlightPage()),
                );
              },
              child: Text('Flight'),
            ),
            ElevatedButton(
              onPressed: () {
                // Add navigation for Reservation Page
              },
              child: Text('Reservation'),
            ),
          ],
        ),
      ),
    );
  }
}
