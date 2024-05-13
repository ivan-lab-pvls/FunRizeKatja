import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funrize/app/theme.dart';

class GiveStarsTile extends StatelessWidget {
  const GiveStarsTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: surfaceColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Give us 5 stars!',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Your feedback helps us improve',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                'assets/images/main/settings.png',
                width: 130.r,
                height: 122.r,
              ),
            ),
          )
        ],
      ),
    );
  }
}
