import 'package:flutter/material.dart';
import 'add_airplane_page.dart';

class AirplaneListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample data; replace with database call
    final List<Map<String, String>> airplanes = [
      {'type': 'Airbus A350', 'capacity': '300', 'speed': '900 km/h', 'range': '15000 km'},
      {'type': 'Boeing 777', 'capacity': '350', 'speed': '950 km/h', 'range': '17000 km'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Airplane List'),
      ),
      body: ListView.builder(
        itemCount: airplanes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(airplanes[index]['type'] ?? ''),
            subtitle: Text('Capacity: ${airplanes[index]['capacity'] ?? ''}'),
            onTap: () {
              // Navigate to AirplaneDetailPage (if implemented)
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddAirplanePage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
