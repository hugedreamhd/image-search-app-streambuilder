class ImageModel {
  String ImageUrl;
  String tags;

//<editor-fold desc="Data Methods">

  ImageModel({
    required this.ImageUrl,
    required this.tags,
  });

//<ed@override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ImageModel &&
          runtimeType == other.runtimeType &&
          ImageUrl == other.ImageUrl &&
          tags == other.tags);

  @override
  int get hashCode => ImageUrl.hashCode ^ tags.hashCode;

  @override
  String toString() {
    return 'ImageModel{ ImageUrl: $ImageUrl, tags: $tags,}';
  }

  ImageModel copyWith({
    String? ImageUrl,
    String? tags,
  }) {
    return ImageModel(
      ImageUrl: ImageUrl ?? this.ImageUrl,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ImageUrl': ImageUrl,
      'tags': tags,
    };
  }

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      ImageUrl: map['ImageUrl'] as String,
      tags: map['tags'] as String,
    );
  }

//</editor-fold>
}
