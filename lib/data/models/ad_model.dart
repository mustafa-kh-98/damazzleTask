import 'package:damazsle/data/models/categories_model.dart';
import 'package:damazsle/data/models/customer_model.dart';
import 'package:damazsle/data/models/name_model.dart';

class AdModel {
  final int id;
  final String slug;
  final String title;
  final String description;
  final CategoriesModel category;
  final int status;
  final String statusTitle;
  final int publishedStatus;
  final String publishedStatusTitle;
  final NameModel area;
  final NameModel governorate;
  final num? price;
  final int priceType;
  final String priceTypeTitle;
  final int viewsCount;
  final String? coverImage;
  final CustomerModel customer;
  final DateTime publishedDate;
  final DateTime createdAt;
  final bool isFeatured;
  final List<CategoriesModel> categories;

  AdModel({
    required this.id,
    required this.slug,
    required this.title,
    required this.description,
    required this.category,
    required this.status,
    required this.statusTitle,
    required this.publishedStatus,
    required this.publishedStatusTitle,
    required this.area,
    required this.governorate,
    required this.price,
    required this.priceType,
    required this.priceTypeTitle,
    required this.viewsCount,
    required this.coverImage,
    required this.customer,
    required this.publishedDate,
    required this.createdAt,
    required this.isFeatured,
    required this.categories,
  });

  factory AdModel.fromJson(Map<String, dynamic> json) => AdModel(
        id: json["id"],
        slug: json["slug"],
        title: json["title"],
        description: json["description"],
        category: CategoriesModel.fromJson(json["category"]),
        status: json["status"],
        statusTitle: json["status_title"],
        publishedStatus: json["published_status"],
        publishedStatusTitle: json["published_status_title"],
        area: NameModel.fromJson(json["area"]),
        governorate: NameModel.fromJson(json["governorate"]),
        price: json["price"],
        priceType: json["price_type"],
        priceTypeTitle: json["price_type_title"],
        viewsCount: json["views_count"],
        coverImage: json["cover_image"],
        customer: CustomerModel.fromJson(json["customer"]),
        publishedDate: DateTime.parse(json["published_date"]),
        createdAt: DateTime.parse(json["created_at"]),
        isFeatured: json["is_featured"],
        categories: List<CategoriesModel>.from(
            json["categories"].map((x) => CategoriesModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "title": title,
        "description": description,
        "category": category.toJson(),
        "status": status,
        "status_title": statusTitle,
        "published_status": publishedStatus,
        "published_status_title": publishedStatusTitle,
        "area": area.toJson(),
        "governorate": governorate.toJson(),
        "price": price,
        "price_type": priceType,
        "price_type_title": priceTypeTitle,
        "views_count": viewsCount,
        "cover_image": coverImage,
        "customer": customer.toJson(),
        "published_date":
            "${publishedDate.year.toString().padLeft(4, '0')}-${publishedDate.month.toString().padLeft(2, '0')}-${publishedDate.day.toString().padLeft(2, '0')}",
        "created_at": createdAt.toIso8601String(),
        "is_featured": isFeatured,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}
