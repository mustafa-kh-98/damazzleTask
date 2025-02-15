import 'package:damazsle/core/styles/app_colors.dart';
import 'package:damazsle/core/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonCircle extends StatelessWidget {
  const ButtonCircle({
    super.key,
    this.svg,
    this.icon,
    this.onPressed,
    this.boxFit,
    this.color,
    this.isLoading = false,
    this.useBorder = false,
    this.showShadow = false,
    this.useColorForSvg = true,
    this.iconColor,
    this.iconSize = 25,
    this.size = const Size(45, 45),
    this.textDirection,
  }) : assert(!(svg != null && icon != null));
  final Size size;
  final String? svg;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  final Color? color;
  final BoxFit? boxFit;
  final bool isLoading;
  final bool useColorForSvg;
  final bool useBorder;
  final bool showShadow;
  final void Function()? onPressed;

  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    Widget? child;

    if (svg != null) {
      child = Common.defaultSvgImg(
        svg: svg!,
        width: iconSize,
        height: iconSize,
        boxFit: BoxFit.cover,
        iconColor:
            !useColorForSvg ? null : iconColor ?? context.theme.iconTheme.color,
      );
    } else if (icon != null) {
      child = Icon(
        icon,
        color: iconColor ?? context.theme.iconTheme.color,
        size: iconSize,
        key: Key(icon!.codePoint.toString()),
        textDirection: textDirection,
      );
    }
    return UnconstrainedBox(
      child: Stack(
        children: [
          Container(
            height: size.height,
            width: size.height,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color ?? context.theme.iconTheme.color,
              border: useBorder
                  ? Border.all(
                      color: iconColor ?? context.theme.iconTheme.color!,
                    )
                  : null,
              boxShadow: showShadow
                  ? [
                      BoxShadow(
                        color: const Color(0xff585C5F).withOpacity(.19),
                        offset: const Offset(0, 2),
                        blurRadius: 5,
                        spreadRadius: -1,
                      ),
                    ]
                  : [],
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (child, animation) => ScaleTransition(
                scale: animation,
                child: child,
              ),
              child: child,
            ),
          ),
          if (!isLoading)
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(size.width / 2),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onPressed,
                    splashColor: AppColors.primary.lighter,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
