import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Flight {
  final int? id;
  final String departureCity;
  final String destinationCity;
  final String departureTime;
  final String arrivalTime;

  Flight({
    this.id,
    required this.departureCity,
    required this.destinationCity,
    required this.departureTime,
    required this.arrivalTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'departureCity': departureCity,
      'destinationCity': destinationCity,
      'departureTime': departureTime,
      'arrivalTime': arrivalTime,
    };
  }

  static Flight fromMap(Map<String, dynamic> map) {
    return Flight(
      id: map['id'],
      departureCity: map['departureCity'],
      destinationCity: map['destinationCity'],
      departureTime: map['departureTime'],
      arrivalTime: map['arrivalTime'],
    );
  }
}

class FlightsDatabase {
  static final FlightsDatabase instance = FlightsDatabase._init();

  static Database? _database;

  FlightsDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('flights.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE flights (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      departureCity TEXT NOT NULL,
      destinationCity TEXT NOT NULL,
      departureTime TEXT NOT NULL,
      arrivalTime TEXT NOT NULL
    )
    ''');
  }

  Future<Flight> create(Flight flight) async {
    final db = await instance.database;

    final id = await db.insert('flights', flight.toMap());
    return flight.copyWith(id: id);
  }

  Future<Flight> readFlight(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      'flights',
      columns: ['id', 'departureCity', 'destinationCity', 'departureTime', 'arrivalTime'],
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Flight.fromMap(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Flight>> readAllFlights() async {
    final db = await instance.database;

    final orderBy = 'departureTime ASC';
    final result = await db.query('flights', orderBy: orderBy);

    return result.map((json) => Flight.fromMap(json)).toList();
  }

  Future<int> update(Flight flight) async {
    final db = await instance.database;

    return db.update(
      'flights',
      flight.toMap(),
      where: 'id = ?',
      whereArgs: [flight.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      'flights',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}

extension CopyWith on Flight {
  Flight copyWith({
    int? id,
    String? departureCity,
    String? destinationCity,
    String? departureTime,
    String? arrivalTime,
  }) {
    return Flight(
      id: id ?? this.id,
      departureCity: departureCity ?? this.departureCity,
      destinationCity: destinationCity ?? this.destinationCity,
      departureTime: departureTime ?? this.departureTime,
      arrivalTime: arrivalTime ?? this.arrivalTime,
    );
  }
}
