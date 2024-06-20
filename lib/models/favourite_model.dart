class FavouriteModel {
  Data? data;
  int? error;
  String? massage;

  FavouriteModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    error = json['error'];
    massage = json['massage'];
  }

}

class Data {
  Favourites? favourites;



  Data.fromJson(Map<String, dynamic> json) {
    favourites = json['favourites'] != null
        ?  Favourites.fromJson(json['favourites'])
        : null;
  }


}

class Favourites {
  List<FavData>? data;


  Favourites.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <FavData>[];
      json['data'].forEach((v) {
        data!.add( FavData.fromJson(v));
      });
    }

  }


}

class FavData {
  int? id;
  String? createdAt;
  int? createdBy;
  Product? product;


  FavData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
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

