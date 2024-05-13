import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funrize/app/theme.dart';
import 'package:funrize/common/custom_button.dart';
import 'package:funrize/features/home/domain/emotion_compounds/result/result.dart';

class Page3 extends StatefulWidget {
  final Function(int) onPressed;
  const Page3({
    super.key,
    required this.onPressed,
  });

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  int? selected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('What is the result of this game?'),
            SizedBox(height: 16.h),
            Wrap(
              spacing: 8.r,
              runSpacing: 8.r,
              children: List.generate(
                Result.results.length,
                (index) {
                  final result = Result.results[index];
                  return CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => setState(() => selected = index),
                    child: Container(
                      width: MediaQuery.of(context).size.width - 24.w,
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      decoration: BoxDecoration(
                        color: selected == index
                            ? Theme.of(context).primaryColor
                            : tileColor,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        result.name,
                        style: Theme.of(context).textTheme.labelMedium,
                        textAlign: TextAlign.center,
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
