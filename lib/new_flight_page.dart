import 'package:flutter/material.dart';
import 'flight.dart'; // Ensure this file contains the Flight model definition

class NewFlightPage extends StatefulWidget {
  @override
  _NewFlightPageState createState() => _NewFlightPageState();
}

class _NewFlightPageState extends State<NewFlightPage> {
  final _formKey = GlobalKey<FormState>();
  String _departureCity = '';
  String _arrivalCity = '';
  String _flightNumber = '';
  String _departureTime = '';
  String _arrivalTime = '';
  List<Flight> _flights = [];
  Flight? _selectedFlight;

  void _addFlight() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Flight newFlight = Flight(
        departureCity: _departureCity,
        arrivalCity: _arrivalCity,
        flightNumber: _flightNumber,
        departureTime: _departureTime,
        arrivalTime: _arrivalTime,
      );
      setState(() {
        _flights.add(newFlight);
      });
      _formKey.currentState!.reset();
    }
  }

  void _updateFlight() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        if (_selectedFlight != null) {
          _selectedFlight!.update(
            departureCity: _departureCity,
            arrivalCity: _arrivalCity,
            flightNumber: _flightNumber,
            departureTime: _departureTime,
            arrivalTime: _arrivalTime,
          );
        }
      });
      Navigator.pop(context);
    }
  }

  void _deleteFlight(Flight flight) {
    setState(() {
      _flights.remove(flight);
      // Here, you would also remove the flight from the database
    });
  }

  void _viewFlightDetails(Flight flight) {
    setState(() {
      _selectedFlight = flight;
      _departureCity = flight.departureCity;
      _arrivalCity = flight.arrivalCity;
      _flightNumber = flight.flightNumber;
      _departureTime = flight.departureTime;
      _arrivalTime = flight.arrivalTime;
    });
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Flight Details'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Departure City: ${flight.departureCity}'),
            Text('Arrival City: ${flight.arrivalCity}'),
            Text('Flight Number: ${flight.flightNumber}'),
            Text('Departure Time: ${flight.departureTime}'),
            Text('Arrival Time: ${flight.arrivalTime}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _updateFlight();
            },
            child: Text('Update'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _deleteFlight(flight);
            },
            child: Text('Delete'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Flights'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Departure City'),
                    initialValue: _selectedFlight != null ? _departureCity : '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a departure city';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _departureCity = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Arrival City'),
                    initialValue: _selectedFlight != null ? _arrivalCity : '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an arrival city';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _arrivalCity = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Flight Number'),
                    initialValue: _selectedFlight != null ? _flightNumber : '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a flight number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _flightNumber = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Departure Time'),
                    initialValue: _selectedFlight != null ? _departureTime : '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a departure time';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _departureTime = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Arrival Time'),
                    initialValue: _selectedFlight != null ? _arrivalTime : '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an arrival time';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _arrivalTime = value!;
                    },
                  ),
                  SizedBox(height: 20),
                  if (_selectedFlight != null) ...[
                    ElevatedButton(
                      onPressed: _updateFlight,
                      child: Text('Update Flight'),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        _deleteFlight(_selectedFlight!);
                        Navigator.pop(context);
                      },
                      child: Text('Delete Flight'),
                    ),
                  ] else ...[
                    ElevatedButton(
                      onPressed: _addFlight,
                      child: Text('Add Flight'),
                    ),
                  ],
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _flights.length,
                itemBuilder: (context, index) {
                  final flight = _flights[index];
                  return ListTile(
                    title: Text('${flight.departureCity} to ${flight.arrivalCity}'),
                    subtitle: Text('Flight ${flight.flightNumber}, Departure: ${flight.departureTime}, Arrival: ${flight.arrivalTime}'),
                    onTap: () => _viewFlightDetails(flight),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
