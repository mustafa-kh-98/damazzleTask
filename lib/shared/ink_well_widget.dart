import 'package:flutter/material.dart';

import '../core/styles/app_colors.dart';


class InkWellWidget extends StatelessWidget {
  final Color childColor;
  final Color? highlightColor;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final Color? splashColor;
  final double radius;
  final Widget child;
  final Size size;
  final BoxShape? shape;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final bool isCircle;
  final Border? border;
  final BoxShadow? shadow;

  const InkWellWidget({
    super.key,
    required this.childColor,
    required this.onTap,
    this.splashColor,
    required this.radius,
    required this.child,
    required this.size,
    this.shape,
    this.margin,
    this.padding,
    this.shadow,
    this.highlightColor,
    this.isCircle = false,
    this.border,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: isCircle
          ? BorderRadius.circular(radius)
          : BorderRadius.all(
              Radius.circular(radius),
            ),
      child: Material(
        color: childColor,
        child: InkWell(
          onTap: onTap,
          onLongPress: onLongPress,
          splashColor: splashColor ?? AppColors.primary.light,
          highlightColor: highlightColor,
          child: Container(
            padding: padding,
            margin: margin,
            height: size.height == 0 ? null : size.height,
            width: size.width == 0 ? null : size.width,
            decoration: BoxDecoration(
              borderRadius: isCircle
                  ? BorderRadius.circular(radius)
                  : BorderRadius.all(
                      Radius.circular(radius),
                    ),
              boxShadow: shadow == null ? null : [shadow!],
              color: Colors.transparent,
              border: border,
              shape: shape ?? BoxShape.rectangle,
            ),
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}
