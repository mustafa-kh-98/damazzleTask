import 'package:damazsle/core/utils/common.dart';
import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    super.key,
    this.svg,
    this.icon,
    this.onPressed,
    this.color,
    this.iconColor,
    this.padding = const EdgeInsets.all(7),
    this.margin = EdgeInsets.zero,
    this.iconSize = 25,
    this.textDirection,
  }) : assert(!(svg != null && icon != null));

  final String? svg;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  final Color? color;
  final void Function()? onPressed;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    Widget? child;
    if (svg != null) {
      child = Common.defaultSvgImg(
        svg: svg!,
        width: iconSize,
        height: iconSize,
        iconColor: iconColor ?? Theme.of(context).appBarTheme.foregroundColor,
      );
    } else if (icon != null) {
      child = Icon(
        icon,
        color: iconColor ?? Theme.of(context).appBarTheme.foregroundColor,
        size: iconSize,
        key: Key(icon!.codePoint.toString()),
        textDirection: textDirection,
      );
    }
    return Padding(
      padding: margin,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(50),
        child: UnconstrainedBox(
          child: Container(
            decoration: BoxDecoration(
                color: color ?? Colors.transparent, shape: BoxShape.circle),
            padding: padding,
            alignment: Alignment.center,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (child, animation) => ScaleTransition(
                scale: animation,
                child: child,
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
