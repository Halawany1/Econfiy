class AnalysisModel {
  Data? data;
  int? error;
  String? massage;

  AnalysisModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    error = json['error'];
    massage = json['massage'];
  }


}

class Data {
  double? positivityAverage;
  double? negativityAverage;
  double? ratingAfterFakeFilter;
  double? fakePercentage;
  List<String>? collectionOfPositiveSummrize;
  List<String>? collectionOfNegativeSummrize;
  String? priceTrackingChart;


  Data.fromJson(Map<String, dynamic> json) {
    positivityAverage = json['positivity_average'];
    negativityAverage = json['negativity_average'];
    ratingAfterFakeFilter = json['rating_after_fake_filter'];
    fakePercentage = json['fake_percentage'];
    collectionOfPositiveSummrize =
        json['collectionOfPositiveSummrize'].cast<String>();
    collectionOfNegativeSummrize =
        json['collectionOfNegativeSummrize'].cast<String>();
    priceTrackingChart = json['price_tracking_chart'];
  }

}