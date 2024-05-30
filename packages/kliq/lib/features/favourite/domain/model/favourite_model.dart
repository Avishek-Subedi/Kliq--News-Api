import 'package:hive_flutter/hive_flutter.dart';
part 'favourite_model.g.dart';

/// News Model
@HiveType(typeId: 0)
class FavouriteNews {
  /// News Tilte
  @HiveField(0)
  String? title;

  /// News image url
  @HiveField(1)
  String? imageUrl;

  /// Video Url
  @HiveField(2)
  String? videoUrl;

  /// Language
  @HiveField(3)
  double? language;

  /// Country
  @HiveField(4)
  String? country;

  /// Content
  @HiveField(5)
  String? content;

  /// Description
  @HiveField(6)
  String? description;

  /// Uid
  @HiveField(7)
  String? uid;
}
