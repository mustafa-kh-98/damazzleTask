import 'package:damazsle/core/config/defaults.dart';
import 'package:damazsle/core/styles/app_colors.dart';
import 'package:damazsle/core/styles/theme/text_themes.dart';
import 'package:damazsle/core/utils/common.dart';
import 'package:damazsle/data/models/customer_model.dart';
import 'package:damazsle/generated/locales.g.dart';
import 'package:damazsle/shared/text_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/styles/assets/assets.gen.dart';

class SellerCard extends StatelessWidget {
  final CustomerModel customer;

  const SellerCard({
    super.key,
    required this.customer,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Default.defaultHorizontal,
      child: Column(
        children: [
          Row(
            children: [
              TextWidget(
                LocaleKeys.seller,
                textStyle:
                    context.titleSecondaryColorW700.copyWith(fontSize: 20),
              ),
              const Spacer(),
              TextWidget(
                LocaleKeys.view_all_ads,
                textStyle: context.baseTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary.main,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primary.main,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              _sellerIconCard(),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    customer.name,
                    textStyle: context.baseTextStyle.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: AppColors.secondary.dark,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.secondary.dark,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Common.defaultSvgImg(
                        svg: Assets.icon.location,
                        iconColor: AppColors.primary.main,
                        height: 21,
                        width: 21,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      TextWidget(
                        "دمشق المزة",
                        textStyle: context.titlePrimaryColorW400
                            .copyWith(fontSize: 14),
                      )
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  _sellerIconCard() {
    return SizedBox(
      height: 50,
      width: 50,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primary.main,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Positioned(
            bottom: -3,
            child: Common.defaultSvgImg(
              svg: Assets.icon.person,
              height: 40,
              width: 40,
            ),
          ),
          ClipPath(
            clipper: DarkOverlayClipper(),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DarkOverlayClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.4);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.2, size.width, size.height * 0.4);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
