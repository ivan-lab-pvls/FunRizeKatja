import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:funrize/features/home/domain/emotion/emotion.dart';
import 'package:funrize/features/new_emotion/congratulations_screen.dart';
import 'package:funrize/features/new_emotion/new_emotion_screen.dart';
import 'package:funrize/features/settings/screens/support_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:funrize/app/config/remote_config.dart';
import 'package:funrize/main.dart';
import 'package:funrize/features/home/view/home_screen.dart';

import '../../features/onboarding/onboarding_screen.dart';
import '../../features/settings/screens/privacy_policy_screen.dart';
import '../../features/settings/screens/promotion_screen.dart';
import '../../features/settings/settings_screen.dart';
import '../../features/settings/screens/terms_of_use_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes {
    final isFirstTime = di<SharedPreferences>().getBool('isFirstTime');
    final promotion = di<RemoteConfig>().promotion;
    final showPromotion = promotion != null && promotion.isNotEmpty;
    return [
      AutoRoute(
        page: OnboardingRoute.page,
        initial: isFirstTime! && !showPromotion,
      ),
      AutoRoute(
        page: HomeRoute.page,
        initial: !isFirstTime && !showPromotion,
      ),
      AutoRoute(page: SettingsRoute.page),
      AutoRoute(page: NewEmotionRoute.page),
      AutoRoute(page: CongratulationsRoute.page),
      AutoRoute(page: PrivacyPolicyRoute.page),
      AutoRoute(page: PromotionRoute.page, initial: showPromotion),
      AutoRoute(page: SupportRoute.page),
      AutoRoute(page: TermsOfUseRoute.page),
    ];
  }
}
