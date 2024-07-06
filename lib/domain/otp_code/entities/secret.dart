import 'package:json/json.dart';

@JsonCodable()
class Secret {
  final String value;
  final String name;
  final int interval;
  final int length;
  final bool isGoogle;

  const Secret({
    required this.value,
    required this.name,
    this.interval = 0,
    this.length = 0,
    this.isGoogle = false,
  });
}
