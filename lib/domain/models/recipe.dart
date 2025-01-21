class Recipe {
  final int id;
  final String title;
  final String? image;
  final String? imageType;

  Recipe({
    required this.id,
    required this.title,
    this.image,
    this.imageType,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'] as int,
      title: json['title'] as String,
      image: json['image'] as String?,
      imageType: json['imageType'] as String?,
    );
  }
}
