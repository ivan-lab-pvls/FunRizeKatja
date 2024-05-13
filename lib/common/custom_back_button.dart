import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:funrize/common/contained_icon_button.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ContainedIconButton(
      assetName: 'assets/icons/main/back.svg',
      onPressed: () => context.router.popForced(),
    );
  }
}
