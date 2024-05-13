import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:funrize/app/config/remote_config.dart';
import 'package:funrize/main.dart';
import 'package:funrize/common/base_screen.dart';

@RoutePage()
class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: const CupertinoNavigationBar(
        middle: Text('Support Page'),
        border: null,
      ),
      bottom: false,
      child: Builder(
        builder: (context) {
          final support = di<RemoteConfig>().support;
          if (support != null && support != '') {
            return InAppWebView(
              initialUrlRequest: URLRequest(
                url: WebUri(support),
              ),
            );
          } else {
            return const Center(
              child: Text('Failed to load Support Page'),
            );
          }
        },
      ),
    );
  }
}
