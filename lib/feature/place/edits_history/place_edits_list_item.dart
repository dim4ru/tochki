import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../../shared/ui_kit/spacers.dart';
import '../../../shared/ui_kit/typography.dart';

class PlaceEditsListItem extends StatelessWidget {
  final String edit;

  const PlaceEditsListItem({super.key, required this.edit});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Row(
        children: [
          Text(
            '10 авг\n2021',
            style: TTypography.caption2,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30,
            child: const VerticalDivider(
              color: Colors.black,
              thickness: 1,
            ),
          ),
          Expanded(
              child: Text(
                edit,
                style: TTypography.body2,
              )),
        ],
      ),
      children: [
        ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _editDescriptionItem(MapEntry('Название', edit)),
              _editDescriptionItem(MapEntry('Описание', edit)),
              GestureDetector(
                onTap: () async {
                  await Clipboard.setData(ClipboardData(text: 'sampleid'));
                },
                child: Row(
                  children: [
                    Expanded(child: _editDescriptionItem(MapEntry('Координаты', edit))),
                    SizedBox(width: TSpacers.spacing3,),
                    Icon(Icons.copy_sharp, size: TSpacers.spacing5),
                  ],
                ),
              ),
              _editDescriptionItem(MapEntry('Автор', edit)),
              SizedBox(height: TSpacers.spacing5,),
              SizedBox(
                width: double.infinity,
                child: UiButton.filledPrimary(
                  onPressed: (){},
                  label: Text('Вернуть эту версию', style: TTypography.body3,),
                ),
              ),
            ],
          )

        ),
      ],
    );
  }
}

Widget _editDescriptionItem(MapEntry<String, String> row) {
  return Text.rich(
    TextSpan(
      children: <TextSpan>[
        TextSpan(
          text: '${row.key}: ',
          style: TTypography.body3,
        ),
        TextSpan(
          text: row.value,
          style: TTypography.body4,
        ),
      ],
    ),
  );
}