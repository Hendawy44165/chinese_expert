import 'package:chinese_expert/controllers/home_controller.dart';
import 'package:chinese_expert/controllers/practice_controller.dart';
import 'package:chinese_expert/models/collection_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PracticeNotifier extends StateNotifier<AsyncValue> {
  PracticeNotifier({required this.collection}) : super(const AsyncLoading()) {
    controller = PracticeController(collection: collection);
  }

  late final PracticeController controller;
  final CollectionModel collection;
  final HomeController homeController = HomeController();
}
