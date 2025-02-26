import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:rive/src/generated/assets/image_asset_base.dart';
import 'package:rive/src/rive_core/shapes/image.dart';

export 'package:rive/src/generated/assets/image_asset_base.dart';

class ImageAsset extends ImageAssetBase {
  ui.Image? _image;
  ui.Image? get image => _image;

  @override
  Future<void> decode(Uint8List bytes) {
    var completer = Completer<void>();
    ui.decodeImageFromList(bytes, (value) {
      _image = value;
      completer.complete();
    });
    return completer.future;
  }

  Image getDefaultObject() => Image()
    ..asset = this
    ..name = name;

  /// The editor works with images as PNGs, even if their sources may have come
  /// from other formats.
  @override
  String get fileExtension => 'png';
}
