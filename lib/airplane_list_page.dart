import 'package:flutter/material.dart';
import 'database_helper.dart'; // Make sure this file exists and is correctly implemented.
import 'airplane.dart'; // Make sure this file exists and is correctly implemented.
import 'localization.dart';
import 'add_edit_airplane_page.dart'; // Import the add/edit airplane page

class AirplaneListPage extends StatefulWidget {
  @override
  _AirplaneListPageState createState() => _AirplaneListPageState();
}

class _AirplaneListPageState extends State<AirplaneListPage> {
  List<Airplane> _airplanes = [];

  @override
  void initState() {
    super.initState();
    _loadAirplanes();
  }

  Future<void> _loadAirplanes() async {
    final airplanes = await DatabaseHelper.instance.getAirplanes();
    setState(() {
      _airplanes = airplanes;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.translate('Airplanes')),
      ),
      body: ListView.builder(
        itemCount: _airplanes.length,
        itemBuilder: (context, index) {
          final airplane = _airplanes[index];
          return ListTile(
            title: Text(airplane.type),
            subtitle: Text(
              '${localizations.translate('Passengers')}: ${airplane.passengers}, ${localizations.translate('Max Speed')}: ${airplane.maxSpeed} km/h, ${localizations.translate('Range')}: ${airplane.range} km',
            ),
            onTap: () async {
              bool? result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddEditAirplanePage(airplane: airplane)),
              );
              if (result == true) {
                _loadAirplanes();
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool? result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddEditAirplanePage()),
          );
          if (result == true) {
            _loadAirplanes();
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
