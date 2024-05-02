class FeedPost {
  final List<String> _feedImages = [
    "assets/media/user1.png",
    "assets/media/user2.png",
    "assets/media/user3.png",
    "assets/media/user4.png",
  ];

  List<String> get images {
    return _feedImages;
  }

  void addNewImg(String newImg) {
    _feedImages.add(newImg);
  }
}
