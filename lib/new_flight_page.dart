import 'package:flutter/material.dart';

class NewFlightPage extends StatefulWidget {
  @override
  _NewFlightPageState createState() => _NewFlightPageState();
}

class _NewFlightPageState extends State<NewFlightPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _departureCityController = TextEditingController();
  final TextEditingController _destinationCityController = TextEditingController();
  final TextEditingController _departureTimeController = TextEditingController();
  final TextEditingController _arrivalTimeController = TextEditingController();

  @override
  void dispose() {
    _departureCityController.dispose();
    _destinationCityController.dispose();
    _departureTimeController.dispose();
    _arrivalTimeController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // Process the data
      print('Departure City: ${_departureCityController.text}');
      print('Destination City: ${_destinationCityController.text}');
      print('Departure Time: ${_departureTimeController.text}');
      print('Arrival Time: ${_arrivalTimeController.text}');
      // You can add further processing, like saving the data to a database
      Navigator.pop(context); // Return to the previous screen after submission
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Flight'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _departureCityController,
                decoration: InputDecoration(labelText: 'Departure City'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a departure city';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _destinationCityController,
                decoration: InputDecoration(labelText: 'Destination City'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a destination city';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _departureTimeController,
                decoration: InputDecoration(labelText: 'Departure Time'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a departure time';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _arrivalTimeController,
                decoration: InputDecoration(labelText: 'Arrival Time'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an arrival time';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
