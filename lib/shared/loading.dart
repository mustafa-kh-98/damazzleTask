import 'package:flutter/cupertino.dart';

import '../core/styles/app_colors.dart';

class LoadingPage extends StatelessWidget {
  final Color? loadingColor;
  final double radius;
  final bool isLoading;

  const LoadingPage({
    super.key,
    this.loadingColor,
    this.radius = 10,
    this.isLoading = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!isLoading) return const SizedBox.shrink();
    return Center(
      child: CupertinoActivityIndicator(
        color: loadingColor ?? AppColors.primary.darker,
        radius: radius,
      ),
    );
  }
}
