import 'package:damazsle/core/utils/common.dart';
import 'package:damazsle/shared/ink_well_widget.dart';
import 'package:damazsle/shared/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavItem extends StatelessWidget {
  final NavBarItem item;
  final void Function() onTap;
  final bool needColor;

  const NavItem({
    super.key,
    required this.item,
    required this.onTap,
    this.needColor = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWellWidget(
      childColor: Colors.transparent,
      onTap: onTap,
      radius: 4,
      padding: const EdgeInsets.all(4),
      size: const Size(0, 0),
      child: Column(
        children: [
          Common.defaultSvgImg(
            svg: item.svg,
            height: 24,
            width: 24,
            iconColor: needColor
                ? item.isSelected
                    ? context.theme.bottomNavigationBarTheme.selectedItemColor
                    : context.theme.bottomNavigationBarTheme.unselectedItemColor
                : null,
          ),
          const SizedBox(
            height: 3,
          ),
          TextWidget(
            item.title,
            textStyle: item.isSelected
                ? context.theme.bottomNavigationBarTheme.selectedLabelStyle
                : context.theme.bottomNavigationBarTheme.unselectedLabelStyle,
          ),
        ],
      ),
    );
  }
}

class NavBarItem {
  final String svg;
  final String title;
  final bool isSelected;

  NavBarItem({
    required this.svg,
    required this.title,
    required this.isSelected,
  });
}
