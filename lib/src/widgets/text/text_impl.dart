import 'package:flcore/flcore.dart';
import 'package:flutter/material.dart';


class FLText extends StatelessWidget {
  const FLText(
    this.data, {
    super.key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  })  : textColor = null,
        fontWeight = null,
        _textTheme = null;

  /// Ekrandaki en büyük metindir;
  ///
  /// Büyük ekranlarda en iyi şekilde çalışırlar.
  const FLText.displayLarge(
    this.data, {
    super.key,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.textColor,
    this.fontWeight,
  })  : style = null,
        _textTheme = FLTextTheme.displayLarge;

  /// Ekrandaki en büyük metindir;
  ///
  /// Büyük ekranlarda en iyi şekilde çalışırlar.
  const FLText.displayMedium(
    this.data, {
    super.key,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.textColor,
    this.fontWeight,
  })  : style = null,
        _textTheme = FLTextTheme.displayMedium;

  /// Ekrandaki en büyük metindir;
  ///
  /// Büyük ekranlarda en iyi şekilde çalışırlar.
  const FLText.displaySmall(
    this.data, {
    super.key,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.textColor,
    this.fontWeight,
  })  : style = null,
        _textTheme = FLTextTheme.displaySmall;

  /// Card veya Dialog'daki başlık metinleri için kullanılır.
  const FLText.headlineLarge(
    this.data, {
    super.key,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.textColor,
    this.fontWeight,
  })  : style = null,
        _textTheme = FLTextTheme.headlineLarge;

  /// Card veya Dialog'daki başlık metinleri için kullanılır.
  const FLText.headlineMedium(
    this.data, {
    super.key,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.textColor,
    this.fontWeight,
  })  : style = null,
        _textTheme = FLTextTheme.headlineMedium;

  /// Card veya Dialog'daki başlık metinleri için kullanılır.
  const FLText.headlineSmall(
    this.data, {
    super.key,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.textColor,
    this.fontWeight,
  })  : style = null,
        _textTheme = FLTextTheme.headlineSmall;

  /// AppBar veya ListTile'daki başlık metinleri için kullanılır.
  const FLText.titleLarge(
    this.data, {
    super.key,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.textColor,
    this.fontWeight,
  })  : style = null,
        _textTheme = FLTextTheme.titleLarge;

  /// AppBar veya ListTile'daki başlık metinleri için kullanılır.
  const FLText.titleMedium(
    this.data, {
    super.key,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.textColor,
    this.fontWeight,
  })  : style = null,
        _textTheme = FLTextTheme.titleMedium;

  /// AppBar veya ListTile'daki başlık metinleri için kullanılır.
  const FLText.titleSmall(
    this.data, {
    super.key,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.textColor,
    this.fontWeight,
  })  : style = null,
        _textTheme = FLTextTheme.titleSmall;

  /// Button veya Chip metinleri için kullanılır.
  const FLText.labelLarge(
    this.data, {
    super.key,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.textColor,
    this.fontWeight,
  })  : style = null,
        _textTheme = FLTextTheme.labelLarge;

  /// Button veya Chip metinleri için kullanılır.
  const FLText.labelMedium(
    this.data, {
    super.key,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.textColor,
    this.fontWeight,
  })  : style = null,
        _textTheme = FLTextTheme.labelMedium;

  /// Button veya Chip metinleri için kullanılır.
  const FLText.labelSmall(
    this.data, {
    super.key,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.textColor,
    this.fontWeight,
  })  : style = null,
        _textTheme = FLTextTheme.labelSmall;

  /// Genel Text metinleri için kullanılır.
  const FLText.bodyLarge(
    this.data, {
    super.key,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.textColor,
    this.fontWeight,
  })  : style = null,
        _textTheme = FLTextTheme.bodyLarge;

  /// Genel Text metinleri için kullanılır.
  const FLText.bodyMedium(
    this.data, {
    super.key,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.textColor,
    this.fontWeight,
  })  : style = null,
        _textTheme = FLTextTheme.bodyMedium;

  /// Genel Text metinleri için kullanılır.
  const FLText.bodySmall(
    this.data, {
    super.key,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.textColor,
    this.fontWeight,
  })  : style = null,
        _textTheme = FLTextTheme.bodySmall;

  final String? data;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final TextScaler? textScaler;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;
  final Color? textColor;
  final FontWeight? fontWeight;

  final FLTextTheme? _textTheme;

  @override
  Widget build(BuildContext context) {
    return switch (data) {
      null || '' => emptyBox,
      _ => Text(
          data!,
          style: style ?? _textTheme?.toTextStyle(context)?.copyWith(color: textColor, fontWeight: fontWeight),
          strutStyle: strutStyle,
          textAlign: textAlign,
          textDirection: textDirection,
          locale: locale,
          softWrap: softWrap,
          overflow: overflow,
          textScaler: textScaler,
          maxLines: maxLines,
          semanticsLabel: semanticsLabel,
          textWidthBasis: textWidthBasis,
          textHeightBehavior: textHeightBehavior,
          selectionColor: selectionColor,
        )
    };
  }
}
