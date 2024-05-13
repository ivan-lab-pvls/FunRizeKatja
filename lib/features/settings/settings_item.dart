import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funrize/app/theme.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final String assetName;
  final Function(BuildContext) onPressed;
  const SettingsItem(
      {super.key,
      required this.title,
      required this.assetName,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (ctx) {
      return CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () => onPressed(ctx),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: surfaceColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(9.r),
                    child: SvgPicture.asset(
                      assetName,
                      width: 18.r,
                      height: 18.r,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              SvgPicture.asset(
                'assets/icons/settings/chevron.svg',
                width: 24.r,
                height: 24.r,
              ),
            ],
          ),
        ),
      );
    });
  }
}
