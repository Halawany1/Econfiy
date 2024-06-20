class SearchProductModel {
  Data? data;
  int? error;
  String? massage;

  SearchProductModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
    error = json['error'];
    massage = json['massage'];
  }


}

class Data {
  Product? product;


  Data.fromJson(Map<String, dynamic> json) {
    product =
    json['product'] != null ?  Product.fromJson(json['product']) : null;
  }


}

class Product {
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
  List<Reviews>? reviews;



  Product.fromJson(Map<String, dynamic> json) {
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
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add( Reviews.fromJson(v));
      });
    }
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

class Reviews {
  int? id;
  String? text;
  String? title;
  String? reviewer;
  int? isFake;
  String? summarize;
  double? positivity;
  double? negativity;
  String? url;
  int? rating;
  String? date;
  List<Null>? images;
  int? productId;



  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    title = json['title'];
    reviewer = json['reviewer'];
    isFake = json['is_fake'];
    summarize = json['summarize'];
    positivity = json['positivity'];
    negativity = json['negativity'];
    url = json['url'];
    rating = json['rating'];
    date = json['date'];

    productId = json['product_id'];
  }


}