import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tochki/shared/ui_kit/typography.dart';
import '../../../shared/ui_kit/colors.dart';

class DistanceBadge extends StatefulWidget {
  final double placeLatitude;
  final double placeLongitude;

  const DistanceBadge({
    Key? key,
    required this.placeLatitude,
    required this.placeLongitude,
  }) : super(key: key);

  @override
  _DistanceBadgeState createState() => _DistanceBadgeState();
}

class _DistanceBadgeState extends State<DistanceBadge> {
  late Future<String> _distanceTextFuture;

  @override
  void initState() {
    super.initState();
    _distanceTextFuture = _loadDistance();
  }

  Future<String> _loadDistance() async {
    // Запросим у пользователя разрешение
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return '—'; // или текст "Доступ отключён"
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return '—';
    }

    // Получаем текущую позицию
    Position pos = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Считаем расстояние в метрах
    double meters = Geolocator.distanceBetween(
      pos.latitude,
      pos.longitude,
      widget.placeLatitude,
      widget.placeLongitude,
    );

    if (meters < 1000) {
      return '${meters.toStringAsFixed(0)} м';
    } else {
      double km = meters / 1000;
      return '${km.toStringAsFixed(1)} км';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Можно, например, открыть карту
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: TColors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                CupertinoIcons.map_pin_ellipse,
                color: TColors.black,
                size: 20,
              ),
              const SizedBox(width: 6),
              FutureBuilder<String>(
                future: _distanceTextFuture,
                builder: (context, snapshot) {
                  String text;
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    text = '...';
                  } else if (snapshot.hasError) {
                    text = '—';
                  } else {
                    text = snapshot.data!;
                  }
                  return Text(
                    text,
                    style: TTypography.caption1
                        .copyWith(color: TColors.black),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
