import 'package:chinese_expert/components/alert_box.dart';
import 'package:chinese_expert/components/collection_tile.dart';
import 'package:chinese_expert/components/custom_button.dart';
import 'package:chinese_expert/components/snack_bar_displayer.dart';
import 'package:chinese_expert/helpers/phrases.dart';
import 'package:chinese_expert/helpers/theming/colors.dart';
import 'package:chinese_expert/helpers/theming/text.dart';
import 'package:chinese_expert/providers/home_provider.dart';
import 'package:chinese_expert/screens/practice_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key, required this.provider});

  final StateNotifierProvider<HomeNotifier, AsyncValue> provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(provider);
    final notifier = ref.read(provider.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Center(
          child: Text(
            PhrasesManager.chineseExpert,
            style: TextStylesManager.white24Regular,
          ),
        ),
      ),
      body: Builder(
        builder: (context) => state.when(data: (data) {
          return _buildCollections(notifier);
        }, error: (e, _) {
          displaySnackBar(context, e as String);
          return _buildCollections(notifier);
        }, loading: () {
          notifier.loadCollections();
          return const Center(
            child: CircularProgressIndicator(
              color: ColorsManager.cyan,
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsManager.cyan,
        shape: const CircleBorder(),
        onPressed: () {
          _showCreationDialog(context, notifier);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  _showCreationDialog(BuildContext context, HomeNotifier notifier) {
    return showDialog(
      context: context,
      builder: (context) => AlertBox(
        title: PhrasesManager.pasteHere,
        body: _buildPastingField(notifier.textController),
        leftButton: CustomButton(
          value: PhrasesManager.cancel,
          onPressed: () {
            notifier.textController.clear();
            Navigator.of(context).pop();
          },
          color: ColorsManager.red,
        ),
        rightButton: CustomButton(
          value: PhrasesManager.create,
          onPressed: () {
            if (notifier.textController.text == '') return;
            notifier.addCollection(notifier.textController.text);
          },
          color: ColorsManager.cyan,
        ),
      ),
    );
  }

  _buildPastingField(TextEditingController controller) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: 1000000.w,
          height: 210.h,
          child: TextField(
            decoration: const InputDecoration(
              fillColor: ColorsManager.gray,
              filled: true,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
            controller: controller,
            cursorColor: ColorsManager.black,
            style: TextStylesManager.color18Bold(ColorsManager.black),
            keyboardType: TextInputType.multiline,
            maxLines: null,
            minLines: null,
            expands: true,
            scrollPhysics: const BouncingScrollPhysics(),
            textAlignVertical: TextAlignVertical.top,
            scrollPadding: EdgeInsets.all(18.r),
          ),
        ),
      );

  _buildCollections(HomeNotifier notifier) {
    if (notifier.collections.isEmpty)
      return Center(
        child: Text(
          PhrasesManager.noCollectionsFound,
          style: TextStylesManager.color18Bold(ColorsManager.darkGray),
        ),
      );
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: notifier.collections.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 4.h),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const PracticeScreen()));
            },
            child: CollectionTile(
                collection: notifier.collections[index], notifier: notifier),
          ),
        ),
      ),
    );
  }
}
