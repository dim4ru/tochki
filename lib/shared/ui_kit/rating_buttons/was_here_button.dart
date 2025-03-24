import 'package:ui_kit/ui_kit.dart';

import '../typography.dart';

class WasHereButton extends StatelessWidget {
  final String name;

  const WasHereButton({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: UiButton.filledPrimary(
        onPressed: (){},
        label: Text('Здесь был $name', style: TTypography.body3,),
      ),
    );
  }
}
