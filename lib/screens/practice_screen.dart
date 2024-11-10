import 'package:auto_size_text/auto_size_text.dart';
import 'package:chinese_expert/components/alert_box.dart';
import 'package:chinese_expert/components/custom_button.dart';
import 'package:chinese_expert/helpers/phrases.dart';
import 'package:chinese_expert/helpers/theming/colors.dart';
import 'package:chinese_expert/helpers/theming/icons.dart';
import 'package:chinese_expert/helpers/theming/text.dart';
import 'package:chinese_expert/models/word_translation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PracticeScreen extends StatefulWidget {
  const PracticeScreen({super.key});

  final 

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  late PageController _pageController;
  bool _isFlipped = false;
  double _currentPage = 0;

  //! test sample
  final List<WordTranslationModel> words = [
    WordTranslationModel(
      word: "约旦",
      pronunciation: "Yuē dàn",
      translation: "الأردن",
    ),
    WordTranslationModel(
      word: "约旦",
      pronunciation: "Yuē dàn",
      translation: "الأردن",
    ),
    WordTranslationModel(
      word: "约旦",
      pronunciation: "Yuē dàn",
      translation: "الأردن",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController()
      ..addListener(() {
        setState(() {
          _currentPage = _pageController.page ?? 0;
          _isFlipped = false;
        });
      });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.cyan,
        title: Text(
          PhrasesManager.practice,
          style: TextStylesManager.white24Regular,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: words.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(16.r),
                  child: _buildFlippingCard(index),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 24.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: _currentPage > 0
                        ? ColorsManager.cyan
                        : ColorsManager.darkGray,
                  ),
                  onPressed: () {
                    if (_currentPage > 0) {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 360),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                ),
                Text(
                  "${(_currentPage + 1).toInt()}/${words.length}",
                  style: TextStylesManager.color18Bold(ColorsManager.cyan),
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: _currentPage < words.length - 1
                        ? ColorsManager.cyan
                        : ColorsManager.darkGray,
                  ),
                  onPressed: () {
                    if (_currentPage < words.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 360),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildFlippingCard(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isFlipped = !_isFlipped;
        });
      },
      child: TweenAnimationBuilder(
        tween: Tween<double>(
          begin: _isFlipped ? 0 : 0,
          end: _isFlipped ? 180 : 0,
        ),
        duration: const Duration(milliseconds: 360),
        builder: (context, double value, child) {
          return Transform(
            transform: Matrix4.identity()..rotateY(value * 3.1415927 / 180),
            alignment: Alignment.center,
            child: value < 90
                ? _buildFrontCard(words[index])
                : Transform(
                    transform: Matrix4.identity()..rotateY(3.1415927),
                    alignment: Alignment.center,
                    child: _buildBackCard(words[index]),
                  ),
          );
        },
      ),
    );
  }

  _buildFrontCard(WordTranslationModel word) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (word.imagePath != null)
                  Expanded(
                    flex: 2,
                    child: Image.asset(
                      word.imagePath!,
                      fit: BoxFit.contain,
                    ),
                  ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          word.word,
                          style:
                              TextStylesManager.color18Bold(ColorsManager.black)
                                  .copyWith(fontSize: 48.sp),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          word.pronunciation,
                          style: TextStylesManager.color18Bold(
                              ColorsManager.darkGray),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              child: Row(
            children: [
              GestureDetector(
                  onTap: () {
                    // TODO: edit
                  },
                  child: IconsManager.edit),
              SizedBox(width: 16.w),
              GestureDetector(
                  onTap: () {
                    // TODO: delete
                  },
                  child: IconsManager.trash),
            ],
          ))
        ],
      ),
    );
  }


  Widget _buildBackCard(WordTranslationModel word) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  word.translation,
                  style: TextStylesManager.color18Bold(ColorsManager.black)
                      .copyWith(fontSize: 48.sp),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buidConfirmDeletionDialog(BuildContext context, WordTranslationModel word, ) {
    return showDialog(
      context: context,
      builder: (context) => AlertBox(
        title: PhrasesManager.confirmDeletion,
        body: AutoSizeText(
          collection.name,
          style: TextStylesManager.red72Semibold,
          maxLines: 1,
        ),
        leftButton: CustomButton(
            value: PhrasesManager.cancel,
            onPressed: () => Navigator.of(context).pop(),
            color: ColorsManager.cyan),
        rightButton: CustomButton(
          value: PhrasesManager.delete,
          onPressed: () => notifier.deleteCollection(collection),
          color: ColorsManager.red,
        ),
      ),
    );
  }
}
