/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/account.png
  AssetGenImage get account => const AssetGenImage('assets/icons/account.png');

  /// File path: assets/icons/goal.png
  AssetGenImage get goal => const AssetGenImage('assets/icons/goal.png');

  /// File path: assets/icons/home.png
  AssetGenImage get home => const AssetGenImage('assets/icons/home.png');

  /// File path: assets/icons/news.png
  AssetGenImage get news => const AssetGenImage('assets/icons/news.png');

  /// File path: assets/icons/ranking.png
  AssetGenImage get ranking => const AssetGenImage('assets/icons/ranking.png');

  /// File path: assets/icons/shield-security.png
  AssetGenImage get shieldSecurity =>
      const AssetGenImage('assets/icons/shield-security.png');

  /// File path: assets/icons/shoes.png
  AssetGenImage get shoes => const AssetGenImage('assets/icons/shoes.png');

  /// File path: assets/icons/soccer-field.png
  AssetGenImage get soccerField =>
      const AssetGenImage('assets/icons/soccer-field.png');

  /// File path: assets/icons/trophy.png
  AssetGenImage get trophy => const AssetGenImage('assets/icons/trophy.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        account,
        goal,
        home,
        news,
        ranking,
        shieldSecurity,
        shoes,
        soccerField,
        trophy
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/blank-profile.png
  AssetGenImage get blankProfile =>
      const AssetGenImage('assets/images/blank-profile.png');

  /// File path: assets/images/bola_zone.png
  AssetGenImage get bolaZone =>
      const AssetGenImage('assets/images/bola_zone.png');

  /// File path: assets/images/bola_zone_round.png
  AssetGenImage get bolaZoneRound =>
      const AssetGenImage('assets/images/bola_zone_round.png');

  /// File path: assets/images/bri_liga_1.png
  AssetGenImage get briLiga1 =>
      const AssetGenImage('assets/images/bri_liga_1.png');

  /// File path: assets/images/error.png
  AssetGenImage get error => const AssetGenImage('assets/images/error.png');

  /// File path: assets/images/logo-liga-1.png
  AssetGenImage get logoLiga1 =>
      const AssetGenImage('assets/images/logo-liga-1.png');

  /// File path: assets/images/shield.png
  AssetGenImage get shield => const AssetGenImage('assets/images/shield.png');

  /// File path: assets/images/stadium.jpg
  AssetGenImage get stadium => const AssetGenImage('assets/images/stadium.jpg');

  /// File path: assets/images/warning.png
  AssetGenImage get warning => const AssetGenImage('assets/images/warning.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        blankProfile,
        bolaZone,
        bolaZoneRound,
        briLiga1,
        error,
        logoLiga1,
        shield,
        stadium,
        warning
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
