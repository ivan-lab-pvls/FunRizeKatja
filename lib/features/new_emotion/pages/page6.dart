import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funrize/app/theme.dart';
import 'package:funrize/common/custom_button.dart';

class Page6 extends StatefulWidget {
  final Function(bool, int) onPressed;
  const Page6({
    super.key,
    required this.onPressed,
  });

  @override
  State<Page6> createState() => _Page6State();
}

class _Page6State extends State<Page6> {
  bool? comingBack;
  int? stars;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Will you play this game again?'),
            SizedBox(height: 16.h),
            Row(
              children: [
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => setState(() => comingBack = true),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2 - 24.w,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    decoration: BoxDecoration(
                      color: comingBack != null
                          ? comingBack!
                              ? Theme.of(context).primaryColor
                              : tileColor
                          : tileColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      'Yes',
                      style: Theme.of(context).textTheme.labelMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => setState(() => comingBack = false),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2 - 24.w,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    decoration: BoxDecoration(
                      color: comingBack != null
                          ? !comingBack!
                              ? Theme.of(context).primaryColor
                              : tileColor
                          : tileColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      'No',
                      style: Theme.of(context).textTheme.labelMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 32.h),
            const Text('How many stars would you give this game?'),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                5,
                (index) {
                  bool condition = false;
                  if (stars != null) {
                    condition = stars! >= index + 1;
                  }
                  return CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => setState(() => stars = index + 1),
                    child: SvgPicture.asset(
                      'assets/icons/main/star.svg',
                      width: 50.r,
                      height: 50.r,
                      colorFilter: condition
                          ? ColorFilter.mode(
                              Theme.of(context).primaryColor,
                              BlendMode.srcIn,
                            )
                          : null,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 24.h),
            CustomButton(
              title: 'Next',
              onPressed: comingBack != null && stars != null
                  ? () => widget.onPressed(comingBack!, stars!)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
