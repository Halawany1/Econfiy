class ProductModel {
  Data? data;
  int? error;
  String? massage;

  ProductModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
    error = json['error'];
    massage = json['massage'];
  }

}

class Data {
  Products? products;

  Data.fromJson(Map<String, dynamic> json) {
    products = json['products'] != null
        ?  Products.fromJson(json['products'])
        : null;
  }


}

class Products {
  List<ProductData>? data;
  Products.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ProductData>[];
      json['data'].forEach((v) {
        data!.add( ProductData.fromJson(v));
      });
    }
  }


}

class ProductData {
  int? id;
  String? name;
  String? price;
  String? url;
  String? shortDescription;
  String? image;
  double? averageRating;
  int? totalReviews;
  String? sellerName;
  int? isFavorite;
  Brand? brand;
  Brand? website;



  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    url = json['url'];
    shortDescription = json['short_description'];
    image = json['image'];
    averageRating = json['average_rating'];
    totalReviews = json['total_reviews'];
    sellerName = json['seller_name'];
    isFavorite = json['is_favorite'];
    brand = json['brand'] != null ?  Brand.fromJson(json['brand']) : null;
    website =
    json['website'] != null ?  Brand.fromJson(json['website']) : null;
  }


}

class Brand {
  int? id;
  String? name;
  String? icon;
  String? url;
  String? createdAt;
  String? updatedAt;


  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    url = json['url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }


}
