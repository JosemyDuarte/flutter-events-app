class TrendingEventModel {
  String title;
  String imagePath;
  String description;
  int nFavorites;
  int nViews;
  int nMessages;

  TrendingEventModel(this.title, this.description, this.imagePath,
      this.nFavorites, this.nViews, this.nMessages);
}

class TrendingEventsClient {
  static List<TrendingEventModel> fetchAll() {
    return [
      TrendingEventModel(
          "Ironman - Zombie Version",
          "Iron Man is a 2008 American superhero film based on the Marvel Comics character of the same name.",
          "assets/images/ironman.png",
          94,
          17000,
          8000),
      TrendingEventModel(
          "Captain America - Civil war",
          "Captain America: The First Avenger is a 2011 American superhero film based on the Marvel Comics character",
          "assets/images/capitanamerica.png",
          92,
          14000,
          4000),
    ];
  }
}
