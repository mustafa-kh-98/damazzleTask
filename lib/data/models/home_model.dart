import 'ad_model.dart';
import 'banners_model.dart';
import 'categories_model.dart';

class HomeModel {
  final List<CategoriesModel> categories;
  final List<BannersModel> banners;
  final List<AdModel> featuredAds;
  final List<AdModel> latestAds;

  HomeModel({
    required this.categories,
    required this.banners,
    required this.featuredAds,
    required this.latestAds,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        categories: List<CategoriesModel>.from(
            json["categories"].map((x) => CategoriesModel.fromJson(x))),
        banners: List<BannersModel>.from(
            json["banners"].map((x) => BannersModel.fromJson(x))),
        featuredAds: List<AdModel>.from(
            json["featuredAds"].map((x) => AdModel.fromJson(x))),
        latestAds: List<AdModel>.from(
            json["latestAds"].map((x) => AdModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
        "featuredAds": List<dynamic>.from(featuredAds.map((x) => x.toJson())),
        "latestAds": List<dynamic>.from(latestAds.map((x) => x.toJson())),
      };
}
