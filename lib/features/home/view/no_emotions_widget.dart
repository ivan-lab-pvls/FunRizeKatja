import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funrize/app/router/router.dart';
import 'package:funrize/common/custom_button.dart';

class NoEmotionsWidget extends StatelessWidget {
  const NoEmotionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: 24.h),
        Image.asset(
          'assets/images/main/before.png',
          width: size.width * 1.5,
          height: size.height / 2.5,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 40.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Text(
                'Start storing your emotions',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const Text(
                'Save the emotions from every game you play and you can always return to them',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.h),
              CustomButton(
                title: 'Start',
                onPressed: () => context.router.push(const NewEmotionRoute()),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
