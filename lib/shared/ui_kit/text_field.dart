import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum UiTextFieldVariant { standard, long }

class SimpleUiTextField extends StatelessWidget {
  const SimpleUiTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.enabled,
    this.inputFormatters,
    this.keyboardType,
    this.maxLength,
    this.onTap,
    this.onEditingComplete,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.autofocus = false,
    this.obscureText = false,
    this.showCounter = false,
    this.variant = UiTextFieldVariant.standard,
    this.hintText,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? enabled;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int? maxLength;
  final VoidCallback? onTap;
  final VoidCallback? onEditingComplete;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final bool autofocus;
  final bool obscureText;
  final bool showCounter;
  final UiTextFieldVariant variant;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final palette = theme.colorScheme;
    final textStyle = theme.textTheme.bodyMedium;

    final isLong = variant == UiTextFieldVariant.long;

    return TextField(
      controller: controller,
      focusNode: focusNode,
      enabled: enabled,
      inputFormatters: inputFormatters,
      keyboardType: isLong ? TextInputType.multiline : keyboardType,
      maxLines: isLong ? null : 1,
      minLines: isLong ? 4 : 1,
      maxLength: maxLength,
      obscureText: obscureText,
      textCapitalization: textCapitalization,
      autofocus: autofocus,
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      textInputAction: textInputAction,
      cursorColor: palette.primary,
      style: textStyle?.copyWith(color: palette.onBackground),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: textStyle?.copyWith(color: palette.onBackground.withOpacity(0.58)),
        counterText: showCounter ? null : '',
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: palette.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: palette.primary, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: palette.error),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: palette.onBackground.withOpacity(0.08)),
        ),
      ),
    );
  }
}
