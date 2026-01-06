import 'package:intl/intl.dart';

class Formatters {
  static final _compact = NumberFormat.compact();

  static String compactInt(int value) => _compact.format(value);
}
