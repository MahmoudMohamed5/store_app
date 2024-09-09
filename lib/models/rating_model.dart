class RatingModel {
  final double rate, count;

  RatingModel({
    required this.rate,
    required this.count,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) { 
    return RatingModel(
      rate: json['rate'],
      count: json['count'],
    );
  }
}
