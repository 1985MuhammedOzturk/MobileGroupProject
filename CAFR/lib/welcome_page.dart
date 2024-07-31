import 'package:flutter/material.dart';
import 'airplane_list_page.dart'; // Import your airplane list page
// Import other pages similarly

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to the CAFR App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AirplaneListPage()),
                );
              },
              child: Text('Airplane List'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.push to Customer List Page
              },
              child: Text('Customer List'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.push to Flights List Page
              },
              child: Text('Flights List'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.push to Reservation Page
              },
              child: Text('Reservation Page'),
            ),
          ],
        ),
      ),
    );
  }
}
