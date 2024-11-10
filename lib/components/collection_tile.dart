import 'package:auto_size_text/auto_size_text.dart';
import 'package:chinese_expert/components/alert_box.dart';
import 'package:chinese_expert/components/custom_button.dart';
import 'package:chinese_expert/components/image_circle.dart';
import 'package:chinese_expert/helpers/phrases.dart';
import 'package:chinese_expert/helpers/theming/colors.dart';
import 'package:chinese_expert/helpers/theming/icons.dart';
import 'package:chinese_expert/helpers/theming/text.dart';
import 'package:chinese_expert/models/collection_model.dart';
import 'package:chinese_expert/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CollectionTile extends StatelessWidget {
  const CollectionTile({
    super.key,
    required this.collection,
    required this.notifier,
  });

  final CollectionModel collection;
  final HomeNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66.h,
      width: 360.w,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
      color: ColorsManager.white,
      child: Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImageCircle(radius: 24.r, image: const SizedBox.shrink()),
                SizedBox(
                  width: 250.w,
                  child: Text(
                    collection.name,
                    style: TextStylesManager.black24Regular,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
            GestureDetector(
                onTap: () {
                  _buidConfirmDeletionDialog(context);
                },
                child: IconsManager.trash),
          ],
        ),
      ),
    );
  }

  _buidConfirmDeletionDialog(BuildContext context) {
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
