import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:funrize/app/config/remote_config.dart';
import 'package:funrize/main.dart';
import 'package:funrize/common/base_screen.dart';

@RoutePage()
class TermsOfUseScreen extends StatelessWidget {
  const TermsOfUseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: const CupertinoNavigationBar(
        middle: Text('Terms & Conditions'),
        border: null,
      ),
      bottom: false,
      child: Builder(
        builder: (context) {
          final termsOfUse = di<RemoteConfig>().termsOfUse;
          if (termsOfUse != null && termsOfUse != '') {
            return InAppWebView(
              initialUrlRequest: URLRequest(
                url: WebUri(termsOfUse),
              ),
            );
          } else {
            return const Center(
              child: Text('Failed to load Terms & Conditions'),
            );
          }
        },
      ),
    );
  }
}
