import 'package:hive_flutter/hive_flutter.dart';

part 'process_emotion.g.dart';

@HiveType(typeId: 3)
class ProcessEmotion {
  @HiveField(0)
  final String name;

  ProcessEmotion({required this.name});

  static final List<ProcessEmotion> processEmotions = [
    ProcessEmotion(name: '😃 Excitation'),
    ProcessEmotion(name: '🤑 Thrill'),
    ProcessEmotion(name: '☺️ Joy of victory'),
    ProcessEmotion(name: '😒 Disappointment'),
    ProcessEmotion(name: '😮‍💨 Concentration'),
    ProcessEmotion(name: '🙄 Impatience'),
  ];
}
