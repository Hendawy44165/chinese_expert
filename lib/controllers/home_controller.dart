import 'package:chinese_expert/models/collection_model.dart';

class HomeController {
  HomeController._internal();
  static final HomeController _instance = HomeController._internal();
  factory HomeController() => _instance;

  Future<List<CollectionModel>?> fetchCollections() async {
    // throw UnimplementedError();
    return Future.delayed(
        const Duration(seconds: 2),
        () => [
              CollectionModel(name: 'collection test 1', id: 1, imagePath: ''),
              CollectionModel(name: 'collection test 2', id: 1, imagePath: ''),
              CollectionModel(name: 'collection test 3', id: 1, imagePath: ''),
              CollectionModel(name: 'collection test 4', id: 1, imagePath: ''),
            ]);
  }

  Future<CollectionModel?> addCollection(String collectionData) async {
    throw UnimplementedError();
  }

  Future<bool> deleteCollection(CollectionModel collection) async {
    throw UnimplementedError();
  }
}
