import 'package:damazsle/features/layout/controller/layout_view_controller.dart';
import 'package:damazsle/features/layout/view/widgets/items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'nav_item.dart';

class BottomNav extends GetView<LayoutViewController> {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 5),
      decoration: BoxDecoration(
        color: context.theme.bottomNavigationBarTheme.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: const Color(0xff585C5F).withOpacity(.19),
            offset: const Offset(0, 2),
            blurRadius: 5,
            spreadRadius: -1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: Items.values
            .map(
              (item) => Obx(
                () => NavItem(
                  needColor: !item.isAdd,
                  onTap: item.isAdd
                      ? () {}
                      : () => controller.onChangePageIndex(item),
                  item: NavBarItem(
                    isSelected: controller.activeScreen == item,
                    svg: item.svg,
                    title: item.toString(),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
