class RecommendedEventModel {
  String tittle;
  String imagePath;
  int rating;

  RecommendedEventModel(this.tittle, this.imagePath, this.rating);
}

class RecommendedEventsClient {
  static List<RecommendedEventModel> fetchAll() {
    return [
      RecommendedEventModel(
          "Spider man - 4", "assets/images/spiderman.png", 94),
      RecommendedEventModel("Sonic", "assets/images/sonic.png", 89),
      RecommendedEventModel("Angry Birds", "assets/images/angrebird.png", 44),
      RecommendedEventModel(
          "Spider man - 4", "assets/images/spiderman.png", 94),
      RecommendedEventModel("Sonic", "assets/images/sonic.png", 89),
      RecommendedEventModel("Angry Birds", "assets/images/angrebird.png", 44),
    ];
  }
}
