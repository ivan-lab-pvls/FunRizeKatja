import 'package:hive_flutter/hive_flutter.dart';

part 'result.g.dart';

@HiveType(typeId: 2)
class Result {
  @HiveField(0)
  final String name;

  Result({required this.name});

  static final List<Result> results = [
    Result(name: '✌️ Victory'),
    Result(name: '🤝 Draw'),
    Result(name: '👎 Defeat'),
  ];
}
