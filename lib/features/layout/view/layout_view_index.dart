import 'package:damazsle/core/extensions/context_ex.dart';
import 'package:damazsle/features/layout/controller/layout_view_controller.dart';
import 'package:damazsle/features/layout/view/widgets/items.dart';
import 'package:damazsle/shared/indexed_transition_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/bottom_nav.dart';

class LayoutViewIndex extends GetView<LayoutViewController> {
  const LayoutViewIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedTransitionSwitcher(
          transitionBuilder: (child, animation, _) {
            const beginOffset = Offset(1.0, 0.0);
            const endOffset = Offset(0.0, 0.0);
            var tween = Tween(begin: beginOffset, end: endOffset);

            var offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
          index: controller.activeScreen.index,
          children: Items.values.map((i) => i.page).toList(),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BottomNav(),
          Container(
            height: context.bottomPadding,
            color: context.theme.bottomNavigationBarTheme.backgroundColor,
          ),
        ],
      ),
    );
  }
}
