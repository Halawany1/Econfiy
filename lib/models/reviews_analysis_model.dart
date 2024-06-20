class ReviewsAnalysisModel {
  Data? data;
  int? error;
  String? massage;

  ReviewsAnalysisModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
    error = json['error'];
    massage = json['massage'];
  }


}

class Data {
  dynamic positivityAverage;
  dynamic negativityAverage;
  dynamic ratingAfterFakeFilter;
  dynamic fakePercentage;
  List<String>? collectionOfPositiveSummrize;
  List<String>? collectionOfNegativeSummrize;

  Data.fromJson(Map<String, dynamic> json) {
    positivityAverage = json['positivity_average'];
    negativityAverage = json['negativity_average'];
    ratingAfterFakeFilter = json['rating_after_fake_filter'];
    fakePercentage = json['fake_percentage'];
    collectionOfPositiveSummrize =
        json['collectionOfPositiveSummrize'].cast<String>();
    collectionOfNegativeSummrize =
        json['collectionOfNegativeSummrize'].cast<String>();
  }


}