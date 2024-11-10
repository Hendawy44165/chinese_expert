class CollectionModel {
  final String name;
  final int id;
  final String imagePath;

  CollectionModel({
    required this.name,
    required this.id,
    required this.imagePath,
  });

  factory CollectionModel.fromJson(Map<String, dynamic> json) {
    return CollectionModel(
      name: json['name'] as String,
      id: json['id'] as int,
      imagePath: json['imagePath'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'imagePath': imagePath,
    };
  }
}
