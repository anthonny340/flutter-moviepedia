import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String ThemovieDbKey = dotenv.env['THE_MOVIEDB_KEY'] ?? "No hay clave API";
}