import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funrize/app/router/router.dart';
import 'package:funrize/app/theme.dart';
import 'package:funrize/common/base_screen.dart';
import 'package:funrize/common/custom_button.dart';
import 'package:funrize/common/settings_button.dart';
import 'package:funrize/features/home/controller/emotions_cubit.dart';
import 'package:funrize/features/home/domain/emotion/emotion.dart';
import 'package:funrize/features/home/view/add_emotions_tile.dart';
import 'package:funrize/features/home/view/emotion_widget.dart';
import 'package:funrize/features/home/view/no_emotions_widget.dart';

final List<String> suits = ['♠️', '♦️', '♣️', '♥️'];

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: kToolbarHeight.h,
        title: Text(
          'Hello! Welcome 👋',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: const [SettingsButton()],
        centerTitle: false,
      ),
      child: BlocBuilder<EmotionsCubit, List<Emotion>>(
        builder: (context, state) {
          if (state.isNotEmpty) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                child: Column(
                  children: [
                    const AddEmotionsTile(),
                    SizedBox(height: 16.h),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final emotion = state[index];
                        String suit = suits[index % 4];
                        return EmotionWidget(suit: suit, emotion: emotion);
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 16.h),
                      itemCount: state.length,
                    ),
                    SizedBox(height: 24.h),
                    CustomButton(
                      title: 'Add New Emotion',
                      onPressed: () =>
                          context.router.push(const NewEmotionRoute()),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const NoEmotionsWidget();
          }
        },
      ),
    );
  }
}
