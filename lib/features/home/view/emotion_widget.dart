import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funrize/app/router/router.dart';
import 'package:funrize/app/theme.dart';
import 'package:funrize/features/home/domain/emotion/emotion.dart';

class EmotionWidget extends StatelessWidget {
  const EmotionWidget({
    super.key,
    required this.suit,
    required this.emotion,
  });

  final String suit;
  final Emotion emotion;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () => context.router.push(
        CongratulationsRoute(emotion: emotion, isNew: false),
      ),
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: superTileColor,
        ),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              width: 54.r,
              height: 54.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white,
              ),
              child: Text(
                suit,
                style: TextStyle(fontSize: 30.sp),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          emotion.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${emotion.game.name} game',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
