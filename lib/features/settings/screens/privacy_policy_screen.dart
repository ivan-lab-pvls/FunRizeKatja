import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:funrize/app/config/remote_config.dart';
import 'package:funrize/main.dart';
import 'package:funrize/common/base_screen.dart';

@RoutePage()
class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: const CupertinoNavigationBar(
        middle: Text('Privacy Policy'),
        border: null,
      ),
      bottom: false,
      child: Builder(
        builder: (context) {
          final privacyPolicy = di<RemoteConfig>().privacyPolicy;
          if (privacyPolicy != null && privacyPolicy != '') {
            return InAppWebView(
              initialUrlRequest: URLRequest(
                url: WebUri(privacyPolicy),
              ),
            );
          } else {
            return const Center(
              child: Text('Failed to load Privacy Policy'),
            );
          }
        },
      ),
    );
  }
}
