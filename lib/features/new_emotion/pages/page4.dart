import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funrize/app/theme.dart';
import 'package:funrize/common/custom_button.dart';
import 'package:funrize/features/home/domain/emotion_compounds/process_emotion/process_emotion.dart';

class Page4 extends StatefulWidget {
  final Function(int, String) onPressed;
  const Page4({
    super.key,
    required this.onPressed,
  });

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  final controller = TextEditingController();
  int? selected;

  @override
  void dispose() {
    controller.dispose();
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
            const Text('What emotions did you feel while playing?'),
            SizedBox(height: 16.h),
            Wrap(
              spacing: 8.r,
              runSpacing: 8.r,
              children: List.generate(
                ProcessEmotion.processEmotions.length,
                (index) {
                  final processEmotion = ProcessEmotion.processEmotions[index];
                  return CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => setState(() => selected = index),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2 - 24.w,
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      decoration: BoxDecoration(
                        color: selected == index
                            ? Theme.of(context).primaryColor
                            : tileColor,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        processEmotion.name,
                        style: Theme.of(context).textTheme.labelMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 24.h),
            const Text(
                'Is there anything in particular that triggered these emotions in you?'),
            SizedBox(height: 12.h),
            TextField(
              controller: controller,
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
            CustomButton(
              title: 'Next',
              onPressed: selected != null
                  ? () => widget.onPressed(selected!, controller.text)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
