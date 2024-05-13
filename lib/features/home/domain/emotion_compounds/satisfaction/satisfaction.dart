import 'package:hive_flutter/hive_flutter.dart';

part 'satisfaction.g.dart';

@HiveType(typeId: 4)
class Satisfaction {
  @HiveField(0)
  final String emoji;
  @HiveField(1)
  final String desc;
  @HiveField(2)
  final int value;

  Satisfaction({
    required this.emoji,
    required this.desc,
    required this.value,
  });

  static final List<Satisfaction> satisfactions = [
    Satisfaction(emoji: '😠', desc: 'Very Bad', value: 0),
    Satisfaction(emoji: '😐', desc: 'Decent', value: 1),
    Satisfaction(emoji: '☺️', desc: 'Good', value: 2),
    Satisfaction(emoji: '🤩', desc: 'Very Good', value: 3),
  ];
}
