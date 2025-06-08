import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tochki/shared/ui_kit/spacers.dart';
import 'package:tochki/shared/ui_kit/typography.dart';

class ErrorPage extends StatelessWidget {
  final String? errorMessage;

  const ErrorPage(this.errorMessage, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('😬', style: TextStyle(fontSize: 100)),
          Text(
            'Что-то пошло не так...',
            style: TTypography.promo,
          ),
          SizedBox(height: TSpacers.spacing9),
          if (errorMessage != null)
            Text(
              textAlign: TextAlign.center,
              errorMessage!,
              style: TTypography.headline2,
            ),
        ]),
      ),
    );
  }
}
