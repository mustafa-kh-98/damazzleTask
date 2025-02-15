import 'package:damazsle/core/styles/theme/text_themes.dart';
import 'package:flutter/material.dart';

import '../../../../shared/text_widget.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color titleColor;

  const InfoCard({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(999),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextWidget(
        title,
        textStyle: context.baseTextStyle.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: titleColor,
        ),
      ),
    );
  }
}
