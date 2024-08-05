import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'flight_dao.dart';
import 'flight.dart';

part 'app_database.g.dart'; // This will be generated

@Database(version: 1, entities: [Flight])
abstract class AppDatabase extends FloorDatabase {
  FlightDao get flightDao;
}
