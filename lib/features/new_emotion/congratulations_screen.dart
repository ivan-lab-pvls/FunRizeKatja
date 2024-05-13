import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funrize/app/router/router.dart';
import 'package:funrize/app/theme.dart';
import 'package:funrize/common/base_screen.dart';
import 'package:funrize/common/custom_back_button.dart';
import 'package:funrize/common/custom_button.dart';
import 'package:funrize/common/custom_button_outlined.dart';
import 'package:funrize/features/home/controller/emotions_cubit.dart';
import 'package:funrize/features/home/domain/emotion/emotion.dart';
import 'package:funrize/features/home/view/home_screen.dart';
import 'package:funrize/features/new_emotion/description.dart';

@RoutePage()
class CongratulationsScreen extends StatelessWidget {
  final Emotion emotion;
  final bool isNew;
  const CongratulationsScreen(
      {super.key, required this.emotion, required this.isNew});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Stack(
        children: [
          Image.asset('assets/images/main/done.png'),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isNew ? 'Your New Emotion' : 'Emotion',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Container(
                    width: 360.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: superTileColor,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 20.h),
                        BlocBuilder<EmotionsCubit, List<Emotion>>(
                          builder: (context, state) {
                            String suit = suits[
                                state.length - (state.length == 1 ? 1 : 0) % 4];
                            return Container(
                              alignment: Alignment.center,
                              width: 74.r,
                              height: 74.r,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Colors.white,
                              ),
                              child: Text(
                                suit,
                                style: TextStyle(fontSize: 40.sp),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 16.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Text(
                            emotion.name,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                        SizedBox(height: 21.h),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            HalfCircleWidget(begin: true),
                            Expanded(
                              child: DottedLine(
                                dashColor: Color.fromRGBO(224, 228, 235, 1),
                              ),
                            ),
                            HalfCircleWidget(begin: false),
                          ],
                        ),
                        SizedBox(height: 19.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (index) {
                            String assetName = 'assets/icons/main/star2.svg';
                            if (index >= emotion.rating) {
                              assetName = 'assets/icons/main/star1.svg';
                            }
                            return SvgPicture.asset(assetName);
                          }),
                        ),
                        SizedBox(height: 15.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Column(
                            children: [
                              Description(
                                title: 'Game',
                                data: emotion.game.name,
                              ),
                              SizedBox(height: 16.h),
                              Description(
                                title: 'Emotions after game',
                                data: emotion.attitude.name,
                              ),
                              SizedBox(height: 16.h),
                              Description(
                                title: 'Game result',
                                data: emotion.result.name,
                              ),
                              SizedBox(height: 16.h),
                              Description(
                                title: 'Emotions throughout the game',
                                data: emotion.processEmotion.name,
                              ),
                              SizedBox(height: 16.h),
                              Description(
                                title: 'Level of satisfaction',
                                data:
                                    '${emotion.satisfaction.emoji} ${emotion.satisfaction.desc}',
                              ),
                              SizedBox(height: 16.h),
                              Description(
                                title: 'Return to game',
                                data: emotion.comingBack ? 'Yes' : 'No',
                              ),
                              SizedBox(height: 20.h),
                            ],
                          ),
                        ),
                        if (emotion.note != null)
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Column(
                              children: [
                                Divider(
                                  indent: 100.w,
                                  endIndent: 100.w,
                                  color: Colors.white.withOpacity(0.2),
                                ),
                                SizedBox(height: 16.h),
                                Text(
                                  'Note about game',
                                  style: TextStyle(
                                    color:
                                        const Color.fromRGBO(216, 255, 254, 1),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  '“${emotion.note}“',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.sp,
                                  ),
                                ),
                                SizedBox(height: 20.h),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  Builder(builder: (context) {
                    if (isNew) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          children: [
                            SizedBox(height: 16.h),
                            CustomButton(
                              title: 'Add New Emotion',
                              onPressed: () => context.router
                                  .replace(const NewEmotionRoute()),
                            ),
                            SizedBox(height: 16.h),
                            CustomButtonOutlined(
                              title: 'Main Page',
                              onPressed: () => context.router.popForced(),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          children: [
                            SizedBox(height: 16.h),
                            CustomButtonOutlined(
                              title: 'Delete',
                              onPressed: () {
                                final cubit = context.read<EmotionsCubit>();
                                final index = cubit.state.indexOf(emotion);
                                cubit.delete(index);
                                context.router.popForced();
                              },
                            ),
                          ],
                        ),
                      );
                    }
                  }),
                ],
              ),
            ),
          ),
          if (!isNew) const CustomBackButton(),
        ],
      ),
    );
  }
}

class HalfCirclePainter extends CustomPainter {
  final bool begin;
  HalfCirclePainter(this.begin);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromRGBO(9, 11, 42, 1)
      ..style = PaintingStyle.fill;

    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(begin ? 0 : size.width, size.height),
          radius: size.width / 2),
      begin ? -pi / 2 : pi / 2,
      pi,
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class HalfCircleWidget extends StatelessWidget {
  final bool begin;
  const HalfCircleWidget({super.key, required this.begin});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: HalfCirclePainter(begin),
      child: const SizedBox(
        width: 30,
      ),
    );
  }
}
