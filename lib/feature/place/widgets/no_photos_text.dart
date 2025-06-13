import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import '../../../shared/ui_kit/colors.dart';
import '../../../shared/ui_kit/typography.dart';

class NoPhotosText extends StatelessWidget {
  final VoidCallback onPressed;

  const NoPhotosText({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          style: TTypography.caption2.copyWith(color: TColors.black),
          children: [
            const TextSpan(
              text: 'Никто не загружал фотографий к этой точке,\nно вы можете ',
            ),
            TextSpan(
              text: 'стать первым',
              style: TTypography.caption1.copyWith(
                color: TColors.black,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()..onTap = onPressed,
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}