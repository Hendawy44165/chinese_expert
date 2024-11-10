import 'package:chinese_expert/controllers/home_controller.dart';
import 'package:chinese_expert/models/collection_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeNotifier extends StateNotifier<AsyncValue> {
  HomeNotifier() : super(const AsyncLoading());

  final textController = TextEditingController();
  final controller = HomeController();
  final List<CollectionModel> collections = [];

  loadCollections() async {
    final _collections = await controller.fetchCollections();
    if (_collections == null)
      return state = AsyncError('loading error', StackTrace.current);
    collections.addAll(_collections);
    state = const AsyncData(null);
  }

  addCollection(String collectionData) async {
    if (state.isLoading) return;
    state = const AsyncLoading();
    final collection = await controller.addCollection(collectionData);
    if (collection == null)
      return state = AsyncError('addition error', StackTrace.current);
    textController.clear();
    collections.add(collection);
    state = const AsyncData(null);
  }

  deleteCollection(CollectionModel collection) async {
    if (state.isLoading) return;
    state = const AsyncLoading();
    final isDeleted = await controller.deleteCollection(collection);
    if (!isDeleted)
      return state = AsyncError('deletion error', StackTrace.current);
    collections.remove(collection);
    state = const AsyncData(null);
  }
}

StateNotifierProvider<HomeNotifier, AsyncValue> getHomeProvider() =>
    StateNotifierProvider((ref) => HomeNotifier());
