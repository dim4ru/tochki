import 'package:flutter/cupertino.dart';
import 'package:tochki/shared/ui_kit/typography.dart';
import 'package:ui_kit/ui_kit.dart';

import '../colors.dart';
import '../shimmers.dart';

class VoteButton extends StatelessWidget {
  const VoteButton({
    super.key,
    required this.buttonState
});

  final VoteButtonState buttonState;

  const VoteButton.loading({super.key}) : buttonState = VoteButtonState.loading;
  const VoteButton.none({super.key}) : buttonState = VoteButtonState.none;
  const VoteButton.like({super.key}) : buttonState = VoteButtonState.like;
  const VoteButton.dislike({super.key}) : buttonState = VoteButtonState.dislike;

  @override
  Widget build(BuildContext context) {
    Color plusButtonBackground = TColors.black;
    Color minusButtonBackground = TColors.black;

    switch (buttonState) {
      case VoteButtonState.loading:
        plusButtonBackground = TColors.black;
        minusButtonBackground = TColors.black;
        break;
      case VoteButtonState.none:
        plusButtonBackground = TColors.black;
        minusButtonBackground = TColors.black;
        break;
      case VoteButtonState.like:
        plusButtonBackground = TColors.white;
        minusButtonBackground = TColors.black;
        break;
      case VoteButtonState.dislike:
        plusButtonBackground = TColors.black;
        minusButtonBackground = TColors.white;
        break;
    }

    Color plusButtonForeground = TColors.black;
    Color minusButtonForeground = TColors.black;

    switch (buttonState) {
      case VoteButtonState.loading:
        plusButtonForeground = TColors.black;
        minusButtonForeground = TColors.black;
        break;
      case VoteButtonState.none:
        plusButtonForeground = TColors.white;
        minusButtonForeground = TColors.white;
        break;
      case VoteButtonState.like:
        plusButtonForeground = TColors.black;
        minusButtonForeground = TColors.white;
        break;
      case VoteButtonState.dislike:
        plusButtonForeground = TColors.white;
        minusButtonForeground = TColors.black;
        break;
    }

    return Row(
      children: [
        Expanded(
          child: UiButton.filledPrimary(
            enabled: false,
            icon: Icon(CupertinoIcons.plus, color: plusButtonForeground,),
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(plusButtonBackground),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    side: BorderSide(color: TColors.black),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8), topRight: Radius.zero, bottomRight: Radius.zero),
                  )),
            ),
          ),
        ),
        UiButton.filledPrimary(
          iconAlignment: IconAlignment.start,
          icon: Icon(Icons.thumbs_up_down_outlined),
          label: buttonState == VoteButtonState.loading ? TShimmers.textShimmer : Text('68%', style: TTypography.body3, textAlign: TextAlign.center,),
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
            icon: Icon(CupertinoIcons.minus, color: minusButtonForeground,),
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(minusButtonBackground),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    side: BorderSide(color: TColors.black),
                    borderRadius: BorderRadius.only(topLeft: Radius.zero, bottomLeft: Radius.zero, topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
                  )),
            ),
          ),
        ),
      ],
    );
  }
}

enum VoteButtonState {
  loading,
  none,
  like,
  dislike,
}
