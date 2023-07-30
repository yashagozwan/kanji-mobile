import 'package:flutter/material.dart';

class LayoutSlot extends StatelessWidget {
  final List<Widget> children;
  final double horizontal;
  final double vertical;
  final double bottom;

  const LayoutSlot({
    super.key,
    this.children = const [],
    this.vertical = 0,
    this.horizontal = 16,
    this.bottom = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: bottom),
      padding: EdgeInsets.symmetric(
        horizontal: horizontal,
        vertical: vertical,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }
}
