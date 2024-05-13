import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:funrize/app/router/router.dart';
import 'package:funrize/common/contained_icon_button.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ContainedIconButton(
      assetName: 'assets/icons/main/settings.svg',
      onPressed: () => context.router.push(const SettingsRoute()),
    );
  }
}
