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
  String? language;

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

  /// Uid
  @HiveField(8)
  String? url;

  FavouriteNews({
    this.title,
    this.imageUrl,
    this.videoUrl,
    this.language,
    this.country,
    this.content,
    this.description,
    this.uid,
    this.url,
  });

  FavouriteNews copyWith({
    String? title,
    String? imageUrl,
    String? videoUrl,
    String? language,
    String? country,
    String? content,
    String? description,
    String? uid,
    String? url,
  }) {
    return FavouriteNews(
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      videoUrl: videoUrl ?? this.videoUrl,
      language: language ?? this.language,
      country: country ?? this.country,
      content: content ?? this.content,
      description: description ?? this.description,
      uid: uid ?? this.uid,
      url: url ?? this.url,
    );
  }
}
