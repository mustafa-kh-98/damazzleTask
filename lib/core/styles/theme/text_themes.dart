import 'package:flutter/material.dart';

extension TextThemes on BuildContext{
  /*
  for font weight we will use
  1: w600 for SemiBold
  2: w400 for Regular
  3: w500 for Medium
  4: w700 for Bold
   */
  ///[For Primary]///
  TextStyle get titlePrimaryColorW700 => Theme.of(this).textTheme.titleLarge!.copyWith(
    fontWeight: FontWeight.w700,
  );
  TextStyle get titlePrimaryColorW600 => Theme.of(this).textTheme.titleLarge!.copyWith(
    fontWeight: FontWeight.w600,
  );
  TextStyle get titlePrimaryColorW500 => Theme.of(this).textTheme.titleLarge!.copyWith(
    fontWeight: FontWeight.w500,
  );
  TextStyle get titlePrimaryColorW400 => Theme.of(this).textTheme.titleLarge!.copyWith(
    fontWeight: FontWeight.w400,
  );

  ///[For Secondary]///
  TextStyle get titleSecondaryColorW700 => Theme.of(this).textTheme.titleMedium!.copyWith(
    fontWeight: FontWeight.w700,
  );
  TextStyle get titleSecondaryColorW600 => Theme.of(this).textTheme.titleMedium!.copyWith(
    fontWeight: FontWeight.w600,
  );
  TextStyle get titleSecondaryColorW500 => Theme.of(this).textTheme.titleMedium!.copyWith(
    fontWeight: FontWeight.w500,
  );
  TextStyle get titleSecondaryColorW400 => Theme.of(this).textTheme.titleMedium!.copyWith(
    fontWeight: FontWeight.w400,
  );

  ///[For Small]///
  TextStyle get titleSmallColorW700 => Theme.of(this).textTheme.titleSmall!.copyWith(
    fontWeight: FontWeight.w700,
  );
  TextStyle get titleSmallColorW600 => Theme.of(this).textTheme.titleSmall!.copyWith(
    fontWeight: FontWeight.w600,
  );
  TextStyle get titleSmallColorW500 => Theme.of(this).textTheme.titleSmall!.copyWith(
    fontWeight: FontWeight.w500,
  );
  TextStyle get titleSmallColorW400 => Theme.of(this).textTheme.titleSmall!.copyWith(
    fontWeight: FontWeight.w400,
  );

  ///[For Custom]///
  TextStyle get baseTextStyle => Theme.of(this).textTheme.titleSmall!;
}