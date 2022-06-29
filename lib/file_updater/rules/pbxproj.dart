import '../file_updater.dart';

class Pbxproj implements UpdateRule {
  Pbxproj(this.key, this.value);

  final String key;
  final String value;

  @override
  String update(String line) {
    final result = line.replaceAllMapped(RegExp('($key[ ]*=[ ]*)[a-zA-Z-_0-9.]*'),
        (Match match) => '${match[1]}$value');

    if(line.contains('.ImageNotification')) {
      return result.substring(0, result.length - 1) + '.ImageNotification;';
    }

    return result;
  }
}
