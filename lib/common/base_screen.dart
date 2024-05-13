import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget child;
  final bool? bottom;
  const BaseScreen({
    super.key,
    this.appBar,
    required this.child,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(bottom: bottom ?? true, child: child),
    );
  }
}
