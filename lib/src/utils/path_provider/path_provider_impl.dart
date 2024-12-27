import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

abstract interface class IFLPathProvider {
  Future<Directory> getApplicationDocumentsDirectory();

  Future<Directory> getApplicationSupportDirectory();

  Future<Directory> getLibraryDirectory();

  Future<Directory> getTemporaryDirectory();

  Future<Directory?> getExternalStorageDirectory();

  Future<Directory> getDownloadsDirectory();
}

class FLPathProvider implements IFLPathProvider {
  @override
  Future<Directory> getApplicationDocumentsDirectory() => path_provider.getApplicationDocumentsDirectory();

  @override
  Future<Directory> getLibraryDirectory() => path_provider.getLibraryDirectory();

  @override
  Future<Directory> getApplicationSupportDirectory() => path_provider.getApplicationSupportDirectory();

  @override
  Future<Directory> getTemporaryDirectory() => path_provider.getTemporaryDirectory();

  @override
  Future<Directory?> getExternalStorageDirectory() => path_provider.getExternalStorageDirectory();

  @override
  Future<Directory> getDownloadsDirectory() => Platform.isAndroid ? SynchronousFuture(Directory('/storage/emulated/0/Download')) : path_provider.getApplicationDocumentsDirectory();
}
