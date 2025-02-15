import 'package:damazsle/core/styles/theme/text_themes.dart';
import 'package:damazsle/shared/arrow_icon.dart';
import 'package:flutter/material.dart';

import '../../../../core/styles/assets/assets.gen.dart';
import '../../../../core/utils/common.dart';
import '../../../../shared/text_widget.dart';

class MoreCard extends StatelessWidget {
  final String title;

  const MoreCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          TextWidget(
            title,
            textStyle: context.titleSecondaryColorW700.copyWith(fontSize: 20),
          ),
          const Spacer(),
          const ArrowIcon(),
        ],
      ),
    );
  }
}
