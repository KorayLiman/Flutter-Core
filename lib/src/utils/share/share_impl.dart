import 'dart:io';

import 'package:share_plus/share_plus.dart';

abstract interface class IFLShare {
  Future<ShareResult> share(String text, {String? subject});

  Future<ShareResult> shareUri(Uri uri);

  Future<ShareResult> shareFile(List<File> files, {String? subject, String? text});
}

class FLShare implements IFLShare {
  @override
  Future<ShareResult> share(String text, {String? subject}) => Share.share(text, subject: subject);

  @override
  Future<ShareResult> shareFile(List<File> files, {String? subject, String? text}) {
    final xFiles = files.map((file) => XFile(file.path)).toList();
    return Share.shareXFiles(xFiles, subject: subject, text: text);
  }

  @override
  Future<ShareResult> shareUri(Uri uri) async => Share.shareUri(uri);
}
