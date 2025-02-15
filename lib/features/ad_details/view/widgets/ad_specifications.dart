import 'package:damazsle/core/config/defaults.dart';
import 'package:damazsle/core/styles/app_colors.dart';
import 'package:damazsle/core/styles/theme/text_themes.dart';
import 'package:damazsle/data/models/ad_details_model.dart';
import 'package:damazsle/features/ad_details/controller/ad_details_view_controller.dart';
import 'package:damazsle/generated/locales.g.dart';
import 'package:damazsle/shared/ink_well_widget.dart';
import 'package:damazsle/shared/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

class AdSpecifications extends GetView<AdDetailsViewController> {
  final AdDetailsModel ad;

  const AdSpecifications({super.key, required this.ad});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Default.defaultHorizontal,
      child: Column(
        children: [
          Column(
            children: ad.fields.map((f) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  children: [
                    TextWidget(
                      f.templateField.fieldName,
                      textStyle:
                          context.titlePrimaryColorW500.copyWith(fontSize: 16),
                    ),
                    const Spacer(),
                    TextWidget(
                      f.value.getValue,
                      textStyle:
                          context.titleSmallColorW500.copyWith(fontSize: 14),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          Obx(
            () {
              return Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  AnimatedContainer(
                    duration: const Duration(
                      milliseconds: 200,
                    ),
                    height:controller.shoMore? null:0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          LocaleKeys.more,
                          textStyle:
                          context.titleSecondaryColorW700.copyWith(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        HtmlWidget(
                          ad.getDescription,
                          textStyle:
                          context.titlePrimaryColorW500.copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  InkWellWidget(
                    childColor: Colors.transparent,
                    onTap: controller.onSwitchMore,
                    radius: 99,
                    size: const Size(0, 30),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          controller.shoMore
                              ? Icons.keyboard_arrow_up_sharp
                              : Icons.keyboard_arrow_down_sharp,
                          color: AppColors.primary.main,
                        ),
                        const SizedBox(width: 10,),
                        TextWidget(
                          controller.shoMore
                              ? LocaleKeys.show_less
                              : LocaleKeys.show_more,
                          textStyle: context.baseTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primary.main,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
