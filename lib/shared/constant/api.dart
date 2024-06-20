class ApiConstant{

  static String baseUrl = "http://10.0.2.2:8000/api/";
  static String login = "auth/login";
  static String register = "auth/register";
  static String product = "product";
  static String recent = "recent";
  static String productById(int id) => "product/$id";
  static String reviews= "reviews";
  static String reviewAnalysis= "reviews-analysis";
  static String fetchUrl= "url-feach";
  static String favourites= "favourites";
  static String profile= "user-data";
  static String updateProfile(int id)=> "auth/update/$id";
  static String recomended = "recomended";
}