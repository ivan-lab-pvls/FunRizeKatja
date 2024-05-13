import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funrize/app/theme.dart';
import 'package:funrize/common/custom_button.dart';
import 'package:funrize/features/home/domain/emotion_compounds/game/game.dart';

class Page1 extends StatefulWidget {
  final Function(int) onPressed;
  const Page1({
    super.key,
    required this.onPressed,
  });

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int? selected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('What game did you play?'),
            SizedBox(height: 16.h),
            Wrap(
              spacing: 12.r,
              runSpacing: 12.r,
              children: List.generate(
                Game.games.length,
                (index) {
                  final game = Game.games[index];
                  return CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => setState(() => selected = index),
                    child: Container(
                      padding: EdgeInsets.all(4.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.r),
                        color: selected == index ? null : tileColor,
                        gradient: selected == index
                            ? const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color.fromRGBO(248, 5, 175, 1),
                                  Color.fromRGBO(98, 47, 227, 1),
                                ],
                              )
                            : null,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2 -
                            20.w -
                            8.w -
                            6.r,
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                          color: tileColor,
                          borderRadius: BorderRadius.circular(18.r),
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: Image.asset(
                                game.assetName,
                                fit: BoxFit.cover,
                                height: 100.h,
                                width: double.infinity,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              game.name,
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 24.h),
            CustomButton(
              title: 'Next',
              onPressed:
                  selected != null ? () => widget.onPressed(selected!) : null,
            ),
          ],
        ),
      ),
    );
  }
}
