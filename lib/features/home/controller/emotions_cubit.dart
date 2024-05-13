import 'package:bloc/bloc.dart';
import 'package:funrize/main.dart';
import 'package:funrize/features/home/domain/emotion/emotion.dart';

class EmotionsCubit extends Cubit<List<Emotion>> {
  EmotionsCubit() : super([]) {
    read();
  }

  void create(Emotion emotion) {
    box.add(emotion).whenComplete(() {
      emit([...state, emotion]);
    });
  }

  void read() {
    List<Emotion> emotions = [];
    if (box.isNotEmpty) {
      for (var i = 0; i < box.length; i++) {
        emotions.add(box.getAt(i)!);
      }
      emit(emotions);
    } else {
      emit([]);
    }
  }

  void update(int index, Emotion emotion) {
    box.putAt(index, emotion).whenComplete(() {
      final List<Emotion> emotions = List.from(state);
      emotions[index] = emotion;
      emit(emotions);
    });
  }

  void delete(int index) {
    box.deleteAt(index).whenComplete(() {
      final List<Emotion> emotions = List.from(state);
      emotions.removeAt(index);
      emit(emotions);
    });
  }
}
