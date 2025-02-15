import 'package:damazsle/core/styles/assets/assets.gen.dart';
import 'package:damazsle/generated/locales.g.dart';

enum MenuCategories {
  cars,
  realEstateForSale,
  realEstateForRent,
  clothingAndAccessories,
  electronics,
  mobilePhones,
  community,
  beautyTools,
  jobsAndBusiness;

  @override
  toString() {
    return switch (this) {
      MenuCategories.cars => LocaleKeys.categories_cars,
      MenuCategories.realEstateForSale =>
        LocaleKeys.categories_real_estate_for_sale,
      MenuCategories.realEstateForRent =>
        LocaleKeys.categories_real_estate_for_rent,
      MenuCategories.clothingAndAccessories =>
        LocaleKeys.categories_clothing_and_accessories,
      MenuCategories.electronics => LocaleKeys.categories_electronics,
      MenuCategories.mobilePhones => LocaleKeys.categories_mobile_phones,
      MenuCategories.community => LocaleKeys.categories_community,
      MenuCategories.beautyTools => LocaleKeys.categories_beauty_tools,
      MenuCategories.jobsAndBusiness => LocaleKeys.categories_jobs_and_business,
    };
  }

  String get svg => switch (this) {
        MenuCategories.cars => Assets.icon.cars,
        MenuCategories.realEstateForSale => Assets.icon.realEstateForSale,
        MenuCategories.realEstateForRent => Assets.icon.realEstateForRent,
        MenuCategories.clothingAndAccessories =>
          Assets.icon.clothingAndAccessories,
        MenuCategories.electronics => Assets.icon.electronics,
        MenuCategories.mobilePhones => Assets.icon.mobilePhones,
        MenuCategories.community => Assets.icon.community,
        MenuCategories.beautyTools => Assets.icon.beautyTools,
        MenuCategories.jobsAndBusiness => Assets.icon.jobsAndBusiness,
      };
}
