import 'package:flutter/material.dart';

class FlightsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flights'),
      ),
      body: Center(
        child: Text('List of Flights'),
      ),
    );
  }
}

