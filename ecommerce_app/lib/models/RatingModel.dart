class RatingModel {
  double rate;
  int count;

  RatingModel({
    this.rate = 0.0,
    this.count = 0,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      rate: json["rate"],
      count: json["count"],
    );
  }

  /* Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
      }; */
}
