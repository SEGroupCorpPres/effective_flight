import 'package:effective_flight/core/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetBackground extends StatelessWidget {
  const WidgetBackground({
    super.key,
    required this.child,
    this.horizontalMargin = 20,
    this.verticalMargin = 20,
    this.horizontalPadding = 20,
    this.verticalPadding = 20,
  });

  final double? horizontalMargin;
  final double? verticalMargin;

  final double? horizontalPadding;
  final double? verticalPadding;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding!, vertical: verticalPadding!),
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin!, vertical: verticalMargin!),
      decoration: BoxDecoration(
        color: AppColors.grey4,
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
