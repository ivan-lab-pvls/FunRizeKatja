import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContainedIconButton extends StatelessWidget {
  final String assetName;
  final VoidCallback onPressed;
  const ContainedIconButton(
      {super.key, required this.assetName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
        padding: EdgeInsets.all(6.r),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).textTheme.bodyMedium!.color!,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: SvgPicture.asset(assetName),
      ),
    );
  }
}
