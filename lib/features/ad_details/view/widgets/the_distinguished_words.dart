import 'package:damazsle/core/styles/theme/text_themes.dart';
import 'package:damazsle/data/models/tag_model.dart';
import 'package:damazsle/generated/locales.g.dart';
import 'package:flutter/material.dart';

import '../../../../core/config/defaults.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../shared/text_widget.dart';
import 'info_card.dart';

class TheDistinguishedWords extends StatelessWidget {
  final List<TagModel> tags;
  const TheDistinguishedWords({super.key, required this.tags});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Default.defaultHorizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            LocaleKeys.featured_keywords,
            textStyle: context.titleSecondaryColorW700.copyWith(fontSize: 20),
          ),
          const SizedBox(
            height: 8,
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: tags
                .map(
                  (t) => InfoCard(
                    backgroundColor: AppColors.secondary.lighter,
                    titleColor: AppColors.secondary.dark,
                    title: t.title,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
