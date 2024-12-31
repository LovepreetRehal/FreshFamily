// To parse this JSON data, do
//
//     final productMiniResponse = productMiniResponseFromJson(jsonString);
//https://app.quicktype.io/
import 'dart:convert';

import 'dart:convert';

// Function to parse the JSON response
ProductMiniResponse productMiniResponseFromJson(String str) =>
    ProductMiniResponse.fromJson(json.decode(str));

String productMiniResponseToJson(ProductMiniResponse data) =>
    json.encode(data.toJson());

// ProductMiniResponse Class
class ProductMiniResponse {
  ProductMiniResponse({
    this.products,
    this.meta,
    this.success,
    this.status,
  });

  List<Product>? products;
  bool? success;
  int? status;
  Meta? meta;

  // Factory constructor to create an instance from JSON
  factory ProductMiniResponse.fromJson(Map<String, dynamic> json) =>
      ProductMiniResponse(
        products: json["data"] != null
            ? List<Product>.from(
          json["data"].map((x) => Product.fromJson(x)),
        )
            : [],
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        success: json["success"],
        status: json["status"],
      );

  // Method to convert the instance back to JSON
  Map<String, dynamic> toJson() => {
    "data": products != null
        ? List<dynamic>.from(products!.map((x) => x.toJson()))
        : [],
    "meta": meta?.toJson(),
    "success": success,
    "status": status,
  };
}

// Product Class
class Product {
  Product({
    this.id,
    this.slug,
    this.name,
    this.thumbnail_image,
    this.main_price,
    this.stroked_price,
    this.has_discount,
    this.discount,
    this.rating,
    this.sales,
    this.links,
    this.isWholesale,
  });

  int? id;
  String? slug;
  String? name;
  String? thumbnail_image;
  String? main_price;
  String? stroked_price;
  bool? has_discount;
  var discount;
  int? rating;
  int? sales;
  Links? links;
  bool? isWholesale;

  // Factory constructor to create an instance from JSON
  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    slug: json["slug"],
    name: json["name"],
    thumbnail_image: json["thumbnail_image"],
    main_price: json["main_price"],
    stroked_price: json["stroked_price"],
    has_discount: json["has_discount"],
    discount: json["discount"],
    rating: json["rating"]?.toInt(),
    sales: json["sales"],
    links: json["links"] != null ? Links.fromJson(json["links"]) : null,
    isWholesale: json["is_wholesale"],
  );

  // Method to convert the instance back to JSON
  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "name": name,
    "thumbnail_image": thumbnail_image,
    "main_price": main_price,
    "stroked_price": stroked_price,
    "has_discount": has_discount,
    "discount": discount,
    "rating": rating,
    "sales": sales,
    "links": links?.toJson(),
    "is_wholesale": isWholesale,
  };
}

// Links Class
class Links {
  Links({
    this.details,
  });

  String? details;

  // Factory constructor to create an instance from JSON
  factory Links.fromJson(Map<String, dynamic> json) => Links(
    details: json["details"],
  );

  // Method to convert the instance back to JSON
  Map<String, dynamic> toJson() => {
    "details": details,
  };
}

// Meta Class
class Meta {
  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  int? currentPage;
  int? from;
  int? lastPage;
  String? path;
  int? perPage;
  int? to;
  int? total;

  // Factory constructor to create an instance from JSON
  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    currentPage: json["current_page"],
    from: json["from"],
    lastPage: json["last_page"],
    path: json["path"],
    perPage: json["per_page"],
    to: json["to"],
    total: json["total"],
  );

  // Method to convert the instance back to JSON
  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "from": from,
    "last_page": lastPage,
    "path": path,
    "per_page": perPage,
    "to": to,
    "total": total,
  };
}

