import 'package:hive_flutter/hive_flutter.dart';

part 'attitude.g.dart';

@HiveType(typeId: 1)
class Attitude {
  @HiveField(0)
  final String name;

  Attitude({required this.name});

  static final List<Attitude> attitudes = [
    Attitude(name: '😃 Excitation'),
    Attitude(name: '😊 Joy'),
    Attitude(name: '😒 Disappointment'),
    Attitude(name: '😎 Confidence'),
    Attitude(name: '😖 Nervousness'),
    Attitude(name: '😡 Anger'),
  ];
}
