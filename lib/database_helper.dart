import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'flight.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  factory DatabaseHelper() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'flights.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE flights(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            departureCity TEXT,
            arrivalCity TEXT,
            flightNumber TEXT,
            departureTime TEXT,
            arrivalTime TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertFlight(Flight flight) async {
    final db = await database;
    await db.insert('flights', {
      'departureCity': flight.departureCity,
      'arrivalCity': flight.arrivalCity,
      'flightNumber': flight.flightNumber,
      'departureTime': flight.departureTime,
      'arrivalTime': flight.arrivalTime,
    });
  }

  Future<List<Flight>> getFlights() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('flights');

    return List.generate(maps.length, (i) {
      return Flight(
        departureCity: maps[i]['departureCity'],
        arrivalCity: maps[i]['arrivalCity'],
        flightNumber: maps[i]['flightNumber'],
        departureTime: maps[i]['departureTime'],
        arrivalTime: maps[i]['arrivalTime'],
      );
    });
  }
}
