import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class TSnackbar {
  /// Показывает снэкбар с [message] на [context].
  static void show(BuildContext context, String message, {Duration duration = const Duration(seconds: 3)}) {
    final overlay = Overlay.of(context);
    if (overlay == null) return;

    final theme = Theme.of(context);
    final colors = theme.colorPalette;
    final typography = theme.appTypography;

    // Создаём OverlayEntry
    final entry = OverlayEntry(
      builder: (ctx) => _TSnackbarOverlay(
        message: message,
        colors: colors,
        typography: typography,
      ),
    );

    // Вставляем и через [duration] убираем
    overlay.insert(entry);
    Future.delayed(duration, () {
      entry.remove();
    });
  }
}

class _TSnackbarOverlay extends StatelessWidget {
  const _TSnackbarOverlay({
    required this.message,
    required this.colors,
    required this.typography,
  });

  final String message;
  final ColorPalette colors;
  final AppTypography typography;

  @override
  Widget build(BuildContext context) {
    // Позиционируем у нижнего края через SafeArea + Align
    return SafeArea(
      minimum: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Material(
          color: Colors.transparent,
          child: Container(
            constraints: const BoxConstraints(minWidth: 60, maxWidth: double.infinity),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: colors.primary,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: colors.foreground.withOpacity(.18),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: DefaultTextStyle(
              style: typography.bodyMedium.copyWith(color: colors.primaryForeground),
              child: Text(message, textAlign: TextAlign.center),
            ),
          ),
        ),
      ),
    );
  }
}
