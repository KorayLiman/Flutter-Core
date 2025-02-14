import 'dart:async';

import 'package:flcore/flcore.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class IFLPermissionManager {
  Future<FLPermissionStatus> getPermissionStatus({required FLPermission permission});
  Future<FLPermissionStatus> requestPermission(BuildContext context, {required FLPermission permission, String? title, String? message, Widget? icon, bool showAskLaterOption = false, bool requestWhenPostponed = false});
}

class FLPermissionManager implements IFLPermissionManager {
  FLPermissionManager({required GlobalKey<NavigatorState> navigatorKey}) : _popupManager = FLPopupManager(navigatorKey: navigatorKey);

  final FLPopupManager _popupManager;

  @override
  Future<FLPermissionStatus> getPermissionStatus({required FLPermission permission}) async {
    try {
      final status = await (await permission.permission()).status;

      final corePermissionStatus = FLPermissionStatus.fromPermissionStatus(status);
      final prefs = await SharedPreferences.getInstance();
      if (prefs.containsKey(permission.sharedPrefKey)) {
        if (!status.isDenied) {
          await prefs.remove(permission.sharedPrefKey);
          return corePermissionStatus;
        } else {
          final postponeMilliSeconds = prefs.getInt(permission.sharedPrefKey);
          if (postponeMilliSeconds != null && postponeMilliSeconds > DateTime.now().millisecondsSinceEpoch) {
            return FLPermissionStatus.postponed;
          } else {
            await prefs.remove(permission.sharedPrefKey);
            return corePermissionStatus;
          }
        }
      } else {
        return corePermissionStatus;
      }
    } catch (e) {
      throw Exception('An exception occurred while getting status for permission $permission. Error was: $e');
    }
  }

  @override
  Future<FLPermissionStatus> requestPermission(
    BuildContext context, {
    required FLPermission permission,
    String? title,
    String? message,
    Widget? icon,

    /// If true, the permission dialog will show the "Ask Later" option.
    ///
    /// If the user selects this option, the permission dialog won't be shown for 7 days even if the permission is requested again.
    bool showAskLaterOption = false,

    /// If true, the permission dialog will be shown when the permission is rejected.
    ///
    /// User will be prompted to grant the permission from the settings.
    bool requestWhenPermanentlyDenied = true,

    /// If true, the permission dialog will be shown even when the permission is postponed.
    bool requestWhenPostponed = false,
  }) async {
    final status = await getPermissionStatus(permission: permission);
    if (status == FLPermissionStatus.granted) return FLPermissionStatus.granted;
    if (status == FLPermissionStatus.postponed && !requestWhenPostponed) return FLPermissionStatus.postponed;
    if (!requestWhenPermanentlyDenied && status == FLPermissionStatus.permanentlyDenied) return FLPermissionStatus.permanentlyDenied;

    if (!context.mounted) throw Exception('Context is not mounted');

    final id = UniqueKey().toString();
    final result = await _popupManager.showModalBottomSheet<FLPermissionStatus>(
       context,
      id: id,
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: false,
      builder: (context) => _PermissionWidget(
        popupManager: _popupManager,
        permission: permission,
        id: id,
        isPermanentDenied: status == FLPermissionStatus.permanentlyDenied,
        showAskLaterOption: showAskLaterOption,
        title: title,
        message: message,
        icon: icon,
      ),
    );
    return result!;
  }
}

@immutable
final class _PermissionWidget extends StatefulWidget {
  const _PermissionWidget({
    required this.popupManager,
    required this.permission,
    required this.id,
    required this.isPermanentDenied,
    required this.showAskLaterOption,
    this.title,
    this.message,
    this.icon,
  });

  final FLPopupManager popupManager;
  final FLPermission permission;
  final String id;
  final bool isPermanentDenied;
  final bool showAskLaterOption;
  final String? title;
  final String? message;
  final Widget? icon;

  @override
  State<_PermissionWidget> createState() => _PermissionWidgetState();
}

final class _PermissionWidgetState extends State<_PermissionWidget> {
  var _title = '';
  var _message = '';
  Widget _icon = const SizedBox();

  Completer<void>? _completer;

  late final AppLifecycleListener _appLifecycleListener;

  @override
  void initState() {
    _appLifecycleListener = AppLifecycleListener(onStateChange: _onStateChange);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _initWidgets();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _appLifecycleListener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final languageCode = context.locale.languageCode;
    return PopScope(
      canPop: false,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: context.height,
        width: context.width,
        color: context.colorScheme.surface,
        child: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: kToolbarHeight,
                  ),
                  SizedBox(
                    height: context.height * 0.1,
                  ),
                  CircleAvatar(
                    radius: 64,
                    backgroundColor: context.colorScheme.primary,
                    child: _icon,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FLText.displaySmall(
                          _title,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                          textColor: context.colorScheme.onSurface,
                        ),
                        verticalBox12,
                        FLText.titleMedium(
                          _message,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.center,
                          textColor: context.colorScheme.onSurface,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: context.width,
                    child: FLFilledButton(
                      borderRadius: BorderRadius.circular(18),
                      onPressed: () async {
                        if (widget.isPermanentDenied) {
                          final alertDialogId = UniqueKey().toString();
                          final isUserOpenedAppSettings = await widget.popupManager.showDefaultAdaptiveAlertDialog<bool>(
                             context,
                            id: alertDialogId,
                            title:  Text(languageCode == 'tr'? 'İzin Gerekli': 'Permission Required'),
                            content: languageCode == 'tr'? Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(text: 'Ayarlardan '),
                                  TextSpan(
                                    text: _title,
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const TextSpan(text: ' vermeniz gerekmektedir'),
                                ],
                              ),
                            ):
                            Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(text: 'You need to give '),
                                  TextSpan(
                                    text: _title,
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const TextSpan(text: ' permission from settings'),
                                ],
                              ),
                            ),
                            okButtonLabel: languageCode == 'tr'? 'Ayarları aç': 'Open Settings',
                            cancelButtonLabel: languageCode == 'tr'? 'İptal': 'Cancel',
                            isDestructiveCancelButtonIOS: true,
                            onOkButtonPressed: () => widget.popupManager.hidePopup<bool>(id: alertDialogId, result: true),
                          );

                          if (isUserOpenedAppSettings ?? false) {
                            _completer = Completer<void>();
                            await openAppSettings();
                            await _completer!.future;
                          } else {
                            widget.popupManager.hidePopup<FLPermissionStatus>(id: widget.id, result: FLPermissionStatus.permanentlyDenied);
                            return;
                          }

                          final status = await (await widget.permission.permission()).status;
                          try {
                            widget.popupManager.hidePopup<FLPermissionStatus>(id: widget.id, result: FLPermissionStatus.fromPermissionStatus(status));
                          } catch (e) {
                            throw Exception('An exception occurred while getting status for permission ${widget.permission}. Error was: $e');
                          }
                        } else {
                          final permission = await widget.permission.permission();
                          final result = await permission.request();
                          widget.popupManager.hidePopup<FLPermissionStatus>(id: widget.id, result: FLPermissionStatus.fromPermissionStatus(result));
                        }
                      },
                      minSize: 50,
                      child: FLText.titleMedium(
                      languageCode == 'tr'?   'Devam Et': 'Continue',
                        textColor: context.colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (widget.showAskLaterOption && !widget.isPermanentDenied) ...[
                    verticalBox8,
                    SizedBox(
                      width: context.width,
                      child: FLTextButton(
                        borderRadius: BorderRadius.circular(18),
                        onPressed: () async {
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setInt(widget.permission.sharedPrefKey, _postponeMilliseconds);

                          widget.popupManager.hidePopup<FLPermissionStatus>(id: widget.id, result: FLPermissionStatus.postponed);
                        },
                        minSize: 50,
                        child: FLText.titleMedium(
                          languageCode == 'tr'? 'Sonra Hatırlat': 'Remind Me Later',
                          textColor: context.colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                  verticalBox24,
                ],
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Column(
                  children: [
                    const SizedBox(
                      height: kToolbarHeight,
                    ),
                    FLIconButton.filled(
                      onPressed: () => widget.popupManager.hidePopup<FLPermissionStatus>(id: widget.id, result: FLPermissionStatus.neverPrompted),
                      icon: Icon(
                        Icons.close,
                        color: context.colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _initWidgets() async {
    _title = widget.title ??  widget.permission.title(context);
    _message = widget.message ?? await widget.permission.message(context);
    if (!mounted) return;
    _icon = widget.icon ?? widget.permission.icon(context);
    scheduleMicrotask(() {
      if (mounted) setState(() {});
    });
  }

  void _onStateChange(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) _completer?.complete();
  }
}

int get _postponeMilliseconds {
  // 7 days
  return DateTime.now().millisecondsSinceEpoch + 1000 * 60 * 60 * 24 * 7;
}
