import 'package:uuid/uuid.dart';

class IdGenerator {
  static String generateTempId() {
    return "tmp-${const Uuid().v1()}";
  }
}
