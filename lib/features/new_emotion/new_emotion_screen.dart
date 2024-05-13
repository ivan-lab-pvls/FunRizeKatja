import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funrize/app/router/router.dart';
import 'package:funrize/app/theme.dart';
import 'package:funrize/common/base_screen.dart';
import 'package:funrize/common/custom_back_button.dart';
import 'package:funrize/common/settings_button.dart';
import 'package:funrize/features/home/controller/emotions_cubit.dart';
import 'package:funrize/features/home/domain/emotion/emotion.dart';
import 'package:funrize/features/home/domain/emotion_compounds/attitude/attitude.dart';
import 'package:funrize/features/home/domain/emotion_compounds/game/game.dart';
import 'package:funrize/features/home/domain/emotion_compounds/process_emotion/process_emotion.dart';
import 'package:funrize/features/home/domain/emotion_compounds/result/result.dart';
import 'package:funrize/features/home/domain/emotion_compounds/satisfaction/satisfaction.dart';
import 'package:funrize/features/new_emotion/pages/page2.dart';
import 'package:funrize/features/new_emotion/pages/page6.dart';
import 'package:funrize/features/new_emotion/pages/page1.dart';
import 'package:funrize/features/new_emotion/pages/page4.dart';
import 'package:funrize/features/new_emotion/pages/page3.dart';
import 'package:funrize/features/new_emotion/pages/page5.dart';
import 'package:funrize/features/new_emotion/pages/page7.dart';

@RoutePage()
class NewEmotionScreen extends StatefulWidget {
  const NewEmotionScreen({super.key});

  @override
  State<NewEmotionScreen> createState() => _NewEmotionScreenState();
}

class _NewEmotionScreenState extends State<NewEmotionScreen> {
  final pageController = PageController();
  int page = 0;
  late int gameIndex;
  late int attitudeIndex;
  late int resultIndex;
  late int processEmotionIndex;
  String? sideNote;
  late int satisfactionIndex;
  late bool comingBack;
  late int stars;
  String? note;
  late String name;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: kToolbarHeight.h,
        title: Text(
          'New emotion',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        leading: const CustomBackButton(),
        actions: const [SettingsButton()],
        centerTitle: false,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Text('${page + 1}/7'),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: Container(
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        color: tileColor,
                      ),
                      child: AnimatedFractionallySizedBox(
                        duration: const Duration(milliseconds: 250),
                        widthFactor: (page + 1) / 7,
                        alignment: Alignment.centerLeft,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90),
                            color: superTileColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children: [
                Page1(
                  onPressed: (int a) {
                    setState(() {
                      gameIndex = a;
                      pageController.animateToPage(
                        ++page,
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.decelerate,
                      );
                    });
                  },
                ),
                Page2(
                  onPressed: (int a) {
                    setState(() {
                      attitudeIndex = a;
                      pageController.animateToPage(
                        ++page,
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.decelerate,
                      );
                    });
                  },
                ),
                Page3(
                  onPressed: (int a) {
                    setState(() {
                      resultIndex = a;
                      pageController.animateToPage(
                        ++page,
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.decelerate,
                      );
                    });
                  },
                ),
                Page4(
                  onPressed: (int a, String b) {
                    setState(() {
                      processEmotionIndex = a;
                      if (b.isNotEmpty) {
                        sideNote = b;
                      }
                      pageController.animateToPage(
                        ++page,
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.decelerate,
                      );
                    });
                  },
                ),
                Page5(
                  onPressed: (int a) {
                    setState(() {
                      satisfactionIndex = a;
                      pageController.animateToPage(
                        ++page,
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.decelerate,
                      );
                    });
                  },
                ),
                Page6(
                  onPressed: (bool a, int b) {
                    setState(() {
                      comingBack = a;
                      stars = b;
                      pageController.animateToPage(
                        ++page,
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.decelerate,
                      );
                    });
                  },
                ),
                Page7(
                  onPressed: (String a, String b) {
                    setState(() {
                      name = b;
                      if (a.isNotEmpty) {
                        note = a;
                      }
                      final emotion = Emotion(
                        game: Game.games[gameIndex],
                        attitude: Attitude.attitudes[attitudeIndex],
                        result: Result.results[resultIndex],
                        processEmotion:
                            ProcessEmotion.processEmotions[processEmotionIndex],
                        satisfaction:
                            Satisfaction.satisfactions[satisfactionIndex],
                        comingBack: comingBack,
                        rating: stars,
                        note: note,
                        name: name,
                      );
                      context.read<EmotionsCubit>().create(
                            emotion,
                          );
                      context.router.replace(
                        CongratulationsRoute(emotion: emotion, isNew: true),
                      );
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
