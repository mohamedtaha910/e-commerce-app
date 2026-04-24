import 'package:hive/hive.dart';

import 'dimensions.dart';
import 'meta.dart';
import 'review.dart';
part 'product.g.dart';

@HiveType(typeId: 0)
class Product {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? description;
  @HiveField(3)
  String? category;
  @HiveField(4)
  double? price;
  @HiveField(5)
  double? discountPercentage;
  @HiveField(6)
  double? rating;
  @HiveField(7)
  int? stock;
  @HiveField(8)
  List<dynamic>? tags;
  @HiveField(9)
  String? brand;
  @HiveField(10)
  String? sku;
  @HiveField(11)
  int? weight;
  @HiveField(12)
  Dimensions? dimensions;
  @HiveField(13)
  String? warrantyInformation;
  @HiveField(14)
  String? shippingInformation;
  @HiveField(15)
  String? availabilityStatus;
  @HiveField(16)
  List<Review>? reviews;
  @HiveField(17)
  String? returnPolicy;
  @HiveField(18)
  int? minimumOrderQuantity;
  @HiveField(19)
  Meta? meta;
  @HiveField(20)
  List<dynamic>? images;
  @HiveField(21)
  String? thumbnail;

  Product({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: int.tryParse(json['id'].toString()),
    title: json['title'] as String?,
    description: json['description'] as String?,
    category: json['category'] as String?,
    price: double.tryParse(json['price'].toString()),
    discountPercentage: double.tryParse(json['discountPercentage'].toString()),
    rating: double.tryParse(json['rating'].toString()),
    stock: int.tryParse(json['stock'].toString()),
    tags: json['tags'],
    brand: json['brand'] as String?,
    sku: json['sku'] as String?,
    weight: int.tryParse(json['weight'].toString()),
    dimensions: json['dimensions'] == null
        ? null
        : Dimensions.fromJson(json['dimensions'] as Map<String, dynamic>),
    warrantyInformation: json['warrantyInformation'] as String?,
    shippingInformation: json['shippingInformation'] as String?,
    availabilityStatus: json['availabilityStatus'] as String?,
    reviews: (json['reviews'] as List<dynamic>?)
        ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
        .toList(),
    returnPolicy: json['returnPolicy'] as String?,
    minimumOrderQuantity: int.tryParse(json['minimumOrderQuantity'].toString()),
    meta: json['meta'] == null
        ? null
        : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    images: json['images'],
    thumbnail: json['thumbnail'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'category': category,
    'price': price,
    'discountPercentage': discountPercentage,
    'rating': rating,
    'stock': stock,
    'tags': tags,
    'brand': brand,
    'sku': sku,
    'weight': weight,
    'dimensions': dimensions?.toJson(),
    'warrantyInformation': warrantyInformation,
    'shippingInformation': shippingInformation,
    'availabilityStatus': availabilityStatus,
    'reviews': reviews?.map((e) => e.toJson()).toList(),
    'returnPolicy': returnPolicy,
    'minimumOrderQuantity': minimumOrderQuantity,
    'meta': meta?.toJson(),
    'images': images,
    'thumbnail': thumbnail,
  };
}
