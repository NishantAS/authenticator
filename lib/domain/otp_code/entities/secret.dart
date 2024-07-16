abstract class Secret {
  final String id;
  final String value;
  final String name;
  final Duration interval;
  final int length;
  final bool isGoogle;

  const Secret({
    required this.id,
    required this.value,
    required this.name,
    this.interval = const Duration(seconds: 30),
    this.length = 6,
    this.isGoogle = false,
  });
}
