import 'package:funrize/main.dart';
import 'package:funrize/features/home/domain/emotion/emotion.dart';
import 'package:funrize/features/home/domain/emotion_compounds/attitude/attitude.dart';
import 'package:funrize/features/home/domain/emotion_compounds/game/game.dart';
import 'package:funrize/features/home/domain/emotion_compounds/process_emotion/process_emotion.dart';
import 'package:funrize/features/home/domain/emotion_compounds/result/result.dart';
import 'package:funrize/features/home/domain/emotion_compounds/satisfaction/satisfaction.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(GameAdapter());
  Hive.registerAdapter(AttitudeAdapter());
  Hive.registerAdapter(ResultAdapter());
  Hive.registerAdapter(ProcessEmotionAdapter());
  Hive.registerAdapter(SatisfactionAdapter());
  Hive.registerAdapter(EmotionAdapter());
  box = await Hive.openBox('box');
}
