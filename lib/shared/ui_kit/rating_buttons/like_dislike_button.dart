import 'package:flutter/cupertino.dart';
import 'package:tochki/shared/ui_kit/typography.dart';
import 'package:ui_kit/ui_kit.dart';

class LikeDislikeButton extends StatelessWidget {
  const LikeDislikeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: UiButton.filledPrimary(
            icon: Icon(CupertinoIcons.plus),
            onPressed: () {},
            style: ButtonStyle(
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8), topRight: Radius.zero, bottomRight: Radius.zero),
                  )),
            ),
          ),
        ),
        UiButton.filledPrimary(
          iconAlignment: IconAlignment.start,
          icon: Icon(Icons.thumbs_up_down_outlined),
          label: Text('68%', style: TTypography.body3, textAlign: TextAlign.center,),
          onPressed: () {},
          style: ButtonStyle(
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                )),
          ),
        ),
        Expanded(
          child: UiButton.filledPrimary(
            icon: Icon(CupertinoIcons.minus),
            onPressed: () {},
            style: ButtonStyle(
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.zero, bottomLeft: Radius.zero, topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
