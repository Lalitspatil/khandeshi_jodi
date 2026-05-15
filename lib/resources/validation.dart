import 'package:khandeshi_jodi/resources/constants.dart';

class Validation {
  Validation._();
  static Validation shared = Validation._();

  Map<String, dynamic> messages = {};

  Future<void> init() async {
    messages = await loadJsonAssets(fileName: 'messages');
  }

  String getValue(String key) {
    return messages[key] ?? '';
  }
}


