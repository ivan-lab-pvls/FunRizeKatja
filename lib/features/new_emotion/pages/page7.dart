import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funrize/app/theme.dart';
import 'package:funrize/common/custom_button.dart';

class Page7 extends StatefulWidget {
  final Function(String, String) onPressed;
  const Page7({
    super.key,
    required this.onPressed,
  });

  @override
  State<Page7> createState() => _Page7State();
}

class _Page7State extends State<Page7> {
  final noteController = TextEditingController();
  final nameController = TextEditingController();

  @override
  void dispose() {
    noteController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Add a note about this game'),
            SizedBox(height: 12.h),
            TextField(
              controller: noteController,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Type here...',
                hintStyle: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: tileColor),
              ),
              maxLines: 4,
            ),
            SizedBox(height: 24.h),
            const Text('Give this emotion a name'),
            SizedBox(height: 12.h),
            TextField(
              controller: nameController,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Name',
                hintStyle: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: tileColor),
              ),
            ),
            SizedBox(height: 24.h),
            CustomButton(
              title: 'Save',
              onPressed: nameController.text.isNotEmpty
                  ? () =>
                      widget.onPressed(noteController.text, nameController.text)
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
