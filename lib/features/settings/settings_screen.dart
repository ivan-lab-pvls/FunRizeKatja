import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funrize/app/router/router.dart';
import 'package:funrize/app/theme.dart';
import 'package:funrize/common/base_screen.dart';
import 'package:funrize/common/custom_back_button.dart';
import 'package:funrize/features/settings/give_stars_tile.dart';
import 'package:funrize/features/settings/settings_item.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:share_plus/share_plus.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool shareable = true;
    return BaseScreen(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: kToolbarHeight.h,
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        leading: const CustomBackButton(),
        centerTitle: false,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 24.h),
            const GiveStarsTile(),
            SizedBox(height: 20.h),
            SettingsItem(
              title: 'Terms & Conditions',
              assetName: 'assets/icons/settings/terms.svg',
              onPressed: (_) => context.router.push(const TermsOfUseRoute()),
            ),
            SizedBox(height: 12.h),
            SettingsItem(
              title: 'Privacy Policy',
              assetName: 'assets/icons/settings/privacy.svg',
              onPressed: (_) => context.router.push(const PrivacyPolicyRoute()),
            ),
            SizedBox(height: 12.h),
            SettingsItem(
              title: 'Support Page',
              assetName: 'assets/icons/settings/support.svg',
              onPressed: (_) => context.router.push(const SupportRoute()),
            ),
            SizedBox(height: 12.h),
            SettingsItem(
              title: 'Rate Us',
              assetName: 'assets/icons/settings/rate.svg',
              onPressed: (_) async {
                final InAppReview inAppReview = InAppReview.instance;
                if (await inAppReview.isAvailable()) {
                  inAppReview.requestReview();
                }
              },
            ),
            SizedBox(height: 12.h),
            SettingsItem(
              title: 'Share App',
              assetName: 'assets/icons/settings/share.svg',
              onPressed: (_) async {
                if (shareable) {
                  shareable = false;
                  final box = _.findRenderObject() as RenderBox?;

                  await Share.share(
                    'Check out FunRize on the AppStore!',
                    sharePositionOrigin:
                        box!.localToGlobal(Offset.zero) & box.size,
                  ).whenComplete(() => shareable = true);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
