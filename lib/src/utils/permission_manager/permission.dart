import 'dart:io';

import 'package:flcore/flcore.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

const _permissionKeyPrefix = 'CorePermissionSharedPreferencesPrefix/';

enum FLPermission {
  notification(sharedPrefKey: '${_permissionKeyPrefix}Notification'),
  camera(sharedPrefKey: '${_permissionKeyPrefix}Camera'),
  photos(sharedPrefKey: '${_permissionKeyPrefix}Photos'),
  microphone(sharedPrefKey: '${_permissionKeyPrefix}Microphone'),
  speech(sharedPrefKey: '${_permissionKeyPrefix}Speech'),
  contact(sharedPrefKey: '${_permissionKeyPrefix}Contact');

  const FLPermission({required this.sharedPrefKey});

  final String sharedPrefKey;

  Future<Permission> permission() async {
    return switch (this) {
      FLPermission.notification => Permission.notification,
      FLPermission.camera => Permission.camera,
      FLPermission.photos => Platform.isAndroid
          ? (await FLDeviceInfo().getAndroidInfo()).version.sdkInt <= 32
              ? Permission.storage
              : Permission.photos
          : Permission.photos,
      FLPermission.microphone => Permission.microphone,
      FLPermission.speech => Permission.speech,
      FLPermission.contact => Permission.contacts,
    };
  }

  String title(BuildContext context) {
    final languageCode = context.locale.languageCode;
    return switch (this) {
      FLPermission.notification => languageCode == 'tr' ? 'Bildirim İzni' : 'Notification Permission',
      FLPermission.camera => languageCode == 'tr' ? 'Kamera İzni' : 'Camera Permission',
      FLPermission.photos => languageCode == 'tr' ? 'Fotoğraf İzni' : 'Photos Permission',
      FLPermission.microphone => languageCode == 'tr' ? 'Mikrofon İzni' : 'Microphone Permission',
      FLPermission.speech => languageCode == 'tr' ? 'Konuşma Tanıma İzni' : 'Speech Permission',
      FLPermission.contact => languageCode == 'tr' ? 'Rehber İzni' : 'Contact Permission',
    };
  }

  Future<String> message(BuildContext context) async {
    final languageCode = context.locale.languageCode;
    final appName = await FLPackageInfo().getAppName();
    return switch (this) {
      FLPermission.notification => languageCode == 'tr' ? '$appName bildirimleri alabilmeniz için izin istiyor' : '$appName wants to receive notifications',
      FLPermission.camera => languageCode == 'tr' ? '$appName kamerayı kullanabilmeniz için izin istiyor' : '$appName wants to use the camera',
      FLPermission.photos => languageCode == 'tr' ? '$appName fotoğraflara erişebilmeniz için izin istiyor' : '$appName wants to access photos',
      FLPermission.microphone => languageCode == 'tr' ? '$appName mikrofonu kullanabilmeniz için izin istiyor' : '$appName wants to use the microphone',
      FLPermission.speech => languageCode == 'tr' ? '$appName konuşma tanıma yapabilmeniz için izin istiyor' : '$appName wants to use speech recognition',
      FLPermission.contact => languageCode == 'tr' ? '$appName rehberi kullanabilmeniz için izin istiyor' : '$appName wants to use the contact list',
    };
  }

  Widget icon(BuildContext context) {
    return switch (this) {
      FLPermission.notification => Icon(
          Icons.notifications,
          size: 50,
          color: context.colorScheme.onPrimary,
        ),
      FLPermission.camera => Icon(
          Icons.camera_alt,
          size: 50,
          color: context.colorScheme.onPrimary,
        ),
      FLPermission.photos => Icon(
          Icons.photo,
          size: 50,
          color: context.colorScheme.onPrimary,
        ),
      FLPermission.microphone || FLPermission.speech => Icon(
          Icons.mic,
          size: 50,
          color: context.colorScheme.onPrimary,
        ),
      FLPermission.contact => Icon(
          Icons.contact_phone,
          size: 50,
          color: context.colorScheme.onPrimary,
        ),
    };
  }
}
