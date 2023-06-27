class Hotel {
  final String title;
  final String location;
  final double rating;
  final double numberOfReviews;
  final double price;
  final String description;
  final List<String> images;
  final String owner;
  final double ownerRating;
  final double ownerReviews;
  final double discount;
  Hotel({
    required this.title,
    required this.location,
    required this.rating,
    required this.numberOfReviews,
    required this.price,
    required this.description,
    required this.images,
    required this.owner,
    required this.ownerRating,
    required this.ownerReviews,
    this.discount = 0,
  });
}
