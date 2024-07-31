import 'package:flutter/material.dart';

class EditAirplanePage extends StatefulWidget {
  final Map<String, dynamic> airplane;

  EditAirplanePage({required this.airplane});

  @override
  _EditAirplanePageState createState() => _EditAirplanePageState();
}

class _EditAirplanePageState extends State<EditAirplanePage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _typeController;
  late TextEditingController _capacityController;
  late TextEditingController _speedController;
  late TextEditingController _rangeController;

  @override
  void initState() {
    super.initState();
    _typeController = TextEditingController(text: widget.airplane['type']);
    _capacityController = TextEditingController(text: widget.airplane['capacity']);
    _speedController = TextEditingController(text: widget.airplane['speed']);
    _rangeController = TextEditingController(text: widget.airplane['range']);
  }

  @override
  void dispose() {
    _typeController.dispose();
    _capacityController.dispose();
    _speedController.dispose();
    _rangeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Airplane'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _typeController,
                decoration: InputDecoration(labelText: 'Airplane Type'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter airplane type';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _capacityController,
                decoration: InputDecoration(labelText: 'Number of Passengers'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter number of passengers';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _speedController,
                decoration: InputDecoration(labelText: 'Maximum Speed'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter maximum speed';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _rangeController,
                decoration: InputDecoration(labelText: 'Range (Distance)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter range';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        final updatedAirplane = {
                          '_id': widget.airplane['_id'],
                          'type': _typeController.text,
                          'capacity': _capacityController.text,
                          'speed': _speedController.text,
                          'range': _rangeController.text,
                        };
                        Navigator.pop(context, updatedAirplane);
                      }
                    },
                    child: Text('Update'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, {'delete': true, '_id': widget.airplane['_id']});
                    },
                    child: Text('Delete'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
