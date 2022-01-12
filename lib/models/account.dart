import './user_preferences.dart';
import 'package:intl/intl.dart';

class Account {
  String username;
  String email;
  UserPreferences? preferences;
  DateFormat? inicialDay;
  DateFormat? finalDay;

  Account({
    required this.username,
    required this.email,
    this.preferences,
    this.inicialDay,
    this.finalDay,
  });
}
