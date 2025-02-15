import 'package:damazsle/core/styles/theme/text_themes.dart';
import 'package:damazsle/features/ad_details/controller/ad_details_view_controller.dart';

import 'package:damazsle/shared/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/loading.dart';
import 'widgets/ad_data.dart';

class AdDetailsViewIndex extends GetView<AdDetailsViewController> {
  const AdDetailsViewIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (controller.isLoading) {
            return const Center(
              child: LoadingPage(),
            );
          }
          if (!controller.isLoading && controller.adDetails == null) {
            return Center(
              child: TextWidget(
                "Error",
                textStyle: context.titlePrimaryColorW700,
              ),
            );
          }
          return const AdData();
        },
      ),
    );
  }
}
