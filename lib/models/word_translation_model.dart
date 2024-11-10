class WordTranslationModel {
  final String word;
  final String pronunciation;
  final String translation;
  final String? imagePath;

  WordTranslationModel({
    required this.word,
    required this.pronunciation,
    required this.translation,
    this.imagePath,
  });

  Map<String, dynamic> toJson() {
    return {
      'word': word,
      'pronunciation': pronunciation,
      'translation': translation,
      'imagePath': imagePath, // Nullable field
    };
  }

  factory WordTranslationModel.fromJson(Map<String, dynamic> json) {
    return WordTranslationModel(
      word: json['word'],
      pronunciation: json['pronunciation'],
      translation: json['translation'],
      imagePath: json['imagePath'], // Nullable field
    );
  }
}
