import 'package:funrize/features/home/domain/emotion_compounds/attitude/attitude.dart';
import 'package:funrize/features/home/domain/emotion_compounds/game/game.dart';
import 'package:funrize/features/home/domain/emotion_compounds/process_emotion/process_emotion.dart';
import 'package:funrize/features/home/domain/emotion_compounds/result/result.dart';
import 'package:funrize/features/home/domain/emotion_compounds/satisfaction/satisfaction.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'emotion.g.dart';

@HiveType(typeId: 5)
class Emotion {
  @HiveField(0)
  final Game game;
  @HiveField(1)
  final Attitude attitude;
  @HiveField(2)
  final Result result;
  @HiveField(3)
  final ProcessEmotion processEmotion;
  @HiveField(4)
  final String? sideNote;
  @HiveField(5)
  final Satisfaction satisfaction;
  @HiveField(6)
  final bool comingBack;
  @HiveField(7)
  final int rating;
  @HiveField(8)
  final String? note;
  @HiveField(9)
  final String name;

  Emotion({
    required this.game,
    required this.attitude,
    required this.result,
    required this.processEmotion,
    this.sideNote,
    required this.satisfaction,
    required this.comingBack,
    required this.rating,
    this.note,
    required this.name,
  });
}
