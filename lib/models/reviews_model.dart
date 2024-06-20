class ReviewsModel {
  Data? data;
  int? error;
  String? massage;

  ReviewsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
    error = json['error'];
    massage = json['massage'];
  }


}

class Data {
  Reviews? reviews;
  Data.fromJson(Map<String, dynamic> json) {
    reviews =
    json['reviews'] != null ?  Reviews.fromJson(json['reviews']) : null;
  }


}

class Reviews {
  List<ReviewsData>? data;

  Reviews.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ReviewsData>[];
      json['data'].forEach((v) {
        data!.add( ReviewsData.fromJson(v));
      });
    }

  }

}

class ReviewsData {
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
  List<String>? images;
  int? productId;



  ReviewsData.fromJson(Map<String, dynamic> json) {
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
    images = json['images'].cast<String>();
    productId = json['product_id'];
  }


}





