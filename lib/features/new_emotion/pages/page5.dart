import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funrize/app/theme.dart';
import 'package:funrize/common/custom_button.dart';
import 'package:funrize/features/home/domain/emotion_compounds/satisfaction/satisfaction.dart';

class Page5 extends StatefulWidget {
  final Function(int) onPressed;
  const Page5({
    super.key,
    required this.onPressed,
  });

  @override
  State<Page5> createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  double selected = 1.5;
  String? emoji;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Rate your level of satisfaction with the game'),
            SizedBox(height: 16.h),
            SliderTheme(
              data: SliderThemeData(
                trackHeight: 10,
                valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
                showValueIndicator: ShowValueIndicator.always,
                trackShape: CustomTrackShape(),
              ),
              child: Slider(
                activeColor: Theme.of(context).primaryColor,
                thumbColor: Theme.of(context).primaryColor,
                inactiveColor: tileColor,
                label: emoji,
                min: 0,
                max: Satisfaction.satisfactions.length.toDouble() - 1,
                value: selected,
                onChanged: (newValue) {
                  final int index = newValue.round();
                  setState(() {
                    selected = newValue;
                    emoji = Satisfaction.satisfactions[index].emoji;
                  });
                },
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('😠'),
                    Text('Very Bad'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('🤩'),
                    Text('Very Good'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24.h),
            CustomButton(
              title: 'Next',
              onPressed: () => widget.onPressed(selected.round()),
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
