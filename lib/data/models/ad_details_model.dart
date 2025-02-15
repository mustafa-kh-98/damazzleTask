import 'package:damazsle/core/config/app_builder.dart';
import 'package:damazsle/data/models/categories_model.dart';
import 'package:damazsle/data/models/customer_model.dart';
import 'package:damazsle/data/models/name_model.dart';
import 'package:damazsle/data/models/tag_model.dart';
import 'package:get/get.dart';

class AdDetailsModel {
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
  final num price;
  final int priceType;
  final String priceTypeTitle;
  final int viewsCount;
  final String? coverImage;
  final CustomerModel customer;
  final String? publishedDate;
  final String? address;
  final String createdAt;
  final bool isFeatured;
  final List<CategoriesModel> categories;
  final CustomerModel createdBy;
  final String descriptionEn;
  final String descriptionAr;
  final List<FieldData> fields;
  final List<TagModel> tags;
  final List<String> images;

  AdDetailsModel({
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
    this.publishedDate,
    this.address,
    required this.createdAt,
    required this.isFeatured,
    required this.categories,
    required this.createdBy,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.fields,
    required this.tags,
    required this.images,
  });

  factory AdDetailsModel.fromJson(Map<String, dynamic> json) {
    return AdDetailsModel(
      id: json['id'],
      slug: json['slug'],
      title: json['title'],
      description: json['description'],
      category: CategoriesModel.fromJson(json['category']),
      status: json['status'],
      statusTitle: json['status_title'],
      publishedStatus: json['published_status'],
      publishedStatusTitle: json['published_status_title'],
      area: NameModel.fromJson(json['area']),
      governorate: NameModel.fromJson(json['governorate']),
      price: json['price'],
      priceType: json['price_type'],
      priceTypeTitle: json['price_type_title'],
      viewsCount: json['views_count'],
      coverImage: json['cover_image'],
      customer: CustomerModel.fromJson(json['customer']),
      publishedDate: json['published_date'],
      address: json['address'],
      createdAt: json['created_at'],
      isFeatured: json['is_featured'],
      categories: (json['categories'] as List)
          .map((e) => CategoriesModel.fromJson(e))
          .toList(),
      createdBy: CustomerModel.fromJson(json['created_by']),
      descriptionEn: json['description_en'],
      descriptionAr: json['description_ar'],
      fields:
          (json['fields'] as List).map((e) => FieldData.fromJson(e)).toList(),
      tags: List<TagModel>.from(json["tags"].map((x) => TagModel.fromJson(x))),
      images: List<String>.from(json["images"].map((x) => x)),
    );
  }

  String get getDescription =>
      Get.find<AppBuilder>().locale.isEnglish ? descriptionEn : descriptionAr;
}

class FieldData {
  final int id;
  final FieldValue value;
  final TemplateField templateField;

  FieldData({
    required this.id,
    required this.value,
    required this.templateField,
  });

  factory FieldData.fromJson(Map<String, dynamic> json) {
    return FieldData(
      id: json['id'],
      value: FieldValue.fromJson(json['value']),
      templateField: TemplateField.fromJson(json['template_field']),
    );
  }
}

class FieldValue {
  final String ar;
  final String en;
  final String? optionId;

  FieldValue({required this.ar, required this.en, this.optionId});

  factory FieldValue.fromJson(Map<String, dynamic> json) {
    return FieldValue(
      ar: json['ar'],
      en: json['en'],
      optionId: json['option_id'],
    );
  }

  String get getValue => Get.find<AppBuilder>().locale.isEnglish ? en : ar;
}

class TemplateField {
  final int id;
  final String fieldName;

  TemplateField({
    required this.id,
    required this.fieldName,
  });

  factory TemplateField.fromJson(Map<String, dynamic> json) {
    return TemplateField(
      id: json['id'],
      fieldName: json['field_name'],
    );
  }
}
