import 'package:damazsle/core/extensions/context_ex.dart';
import 'package:damazsle/core/styles/theme/text_themes.dart';
import 'package:damazsle/shared/text_widget.dart';
import 'package:flutter/material.dart';

import '../core/styles/app_colors.dart';



class ErrorView extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  const ErrorView({super.key, required this.errorDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const AppBackButton(),
      ),
      body: SizedBox(
        height: context.sh,
        width: context.sw,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                color: AppColors.primary.main,
                size: 40,
              ),
              const SizedBox(height: 10,),
              TextWidget(
                errorDetails.exceptionAsString(),
                textStyle: context.titlePrimaryColorW700,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
