import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'add_airplane_page.dart';
import 'edit_airplane_page.dart';

class AirplaneListPage extends StatefulWidget {
  @override
  _AirplaneListPageState createState() => _AirplaneListPageState();
}

class _AirplaneListPageState extends State<AirplaneListPage> {
  List<Map<String, dynamic>> airplanes = [];

  @override
  void initState() {
    super.initState();
    _refreshAirplaneList();
  }

  void _refreshAirplaneList() async {
    final data = await DatabaseHelper.instance.queryAllRows();
    print("Retrieved data: $data"); // Debug print
    setState(() {
      airplanes = data;
    });
  }

  void _addAirplane(Map<String, dynamic> newAirplane) async {
    await DatabaseHelper.instance.insert(newAirplane);
    _refreshAirplaneList();
  }

  void _updateAirplane(Map<String, dynamic> updatedAirplane) async {
    await DatabaseHelper.instance.update(updatedAirplane);
    _refreshAirplaneList();
  }

  void _deleteAirplane(int id) async {
    await DatabaseHelper.instance.delete(id);
    _refreshAirplaneList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Airplane List'),
      ),
      body: ListView.builder(
        itemCount: airplanes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(airplanes[index]['type']),
            subtitle: Text('Capacity: ${airplanes[index]['capacity']}'),
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditAirplanePage(airplane: airplanes[index]),
                ),
              );

              if (result != null) {
                if (result['delete'] == true) {
                  _deleteAirplane(result['_id']);
                } else {
                  _updateAirplane(result);
                }
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newAirplane = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddAirplanePage()),
          );
          if (newAirplane != null) {
            _addAirplane(newAirplane);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
