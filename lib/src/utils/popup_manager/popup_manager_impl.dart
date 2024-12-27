import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flcore/flcore.dart';
import 'package:flcore/src/utils/popup_manager/enums.dart';
import 'package:flcore/src/utils/popup_manager/popup_manager.dart';
import 'package:flcore/src/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'routes.dart';

abstract interface class IFLPopupManager {
  void showLoader(BuildContext context, {String? id, bool barrierDismissible, WidgetBuilder? widgetBuilder});

  Future<T?> showModalBottomSheet<T>(BuildContext context, {required WidgetBuilder builder, String? id, Color? backgroundColor, String? barrierLabel, double? elevation, ShapeBorder? shape, Clip? clipBehavior, BoxConstraints? constraints, Color? barrierColor, bool isScrollControlled, double scrollControlDisabledMaxHeightRatio, bool isDismissible, bool enableDrag, bool? showDragHandle, bool useSafeArea, RouteSettings? routeSettings, AnimationController? transitionAnimationController, Offset? anchorPoint});

  Future<T?> showDialog<T>(BuildContext context, {required WidgetBuilder builder, String? id, bool barrierDismissible, Color? barrierColor, String? barrierLabel, bool useSafeArea, RouteSettings? routeSettings, Offset? anchorPoint, TraversalEdgeBehavior? traversalEdgeBehavior});

  Future<T?> showCupertinoDialog<T>(BuildContext context, {required WidgetBuilder builder, String? id, String? barrierLabel, bool barrierDismissible, RouteSettings? routeSettings, Offset? anchorPoint});

  Future<T?> showCupertinoModalPopup<T>(BuildContext context, {required WidgetBuilder builder, String? id, ImageFilter? filter, Color barrierColor, bool barrierDismissible, bool semanticsDismissible, RouteSettings? routeSettings, Offset? anchorPoint});

  Future<void> showAdaptiveInfoDialog(
    BuildContext context, {
    String? id,
    String? barrierLabel,
    Key? key,
    bool? barrierDismissible,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
    TraversalEdgeBehavior? traversalEdgeBehavior,
    Color? barrierColor,
    bool useSafeArea,
    Widget? title,
    Widget? content,
    EdgeInsetsGeometry? contentPadding,
    EdgeInsetsGeometry? actionsPadding,
    EdgeInsetsGeometry? titlePadding,
    EdgeInsetsGeometry? iconPadding,
    EdgeInsetsGeometry? buttonPadding,
    EdgeInsets? insetPadding,
    AlignmentGeometry? alignment,
    Widget? icon,
    ShapeBorder? shape,
    double? elevation,
    Color? backgroundColor,
    Color? shadowColor,
    MainAxisAlignment? actionsAlignment,
    bool scrollable,
    ScrollController? actionScrollController,
    String? semanticLabel,
    OverflowBarAlignment? actionsOverflowAlignment,
    double? actionsOverflowButtonSpacing,
    VerticalDirection? actionsOverflowDirection,
    Clip clipBehavior,
    TextStyle? contentTextStyle,
    Color? iconColor,
    Curve insetAnimationCurve,
    Duration insetAnimationDuration,
    ScrollController? scrollController,
    Color? surfaceTintColor,
    TextStyle? titleTextStyle,
    String? okButtonLabel,
  });

  Future<T?> showDefaultAdaptiveAlertDialog<T>(
    BuildContext context, {
    String? id,
    String? barrierLabel,
    Key? key,
    bool? barrierDismissible,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
    TraversalEdgeBehavior? traversalEdgeBehavior,
    Color? barrierColor,
    bool useSafeArea = true,
    Widget? title,
    Widget? content,
    bool reversedActions = false,
    EdgeInsetsGeometry? contentPadding,
    EdgeInsetsGeometry? actionsPadding,
    EdgeInsetsGeometry? titlePadding,
    EdgeInsetsGeometry? iconPadding,
    EdgeInsetsGeometry? buttonPadding,
    EdgeInsets? insetPadding,
    AlignmentGeometry? alignment,
    Widget? icon,
    ShapeBorder? shape,
    double? elevation,
    Color? backgroundColor,
    Color? shadowColor,
    MainAxisAlignment? actionsAlignment,
    bool scrollable = false,
    ScrollController? actionScrollController,
    String? semanticLabel,
    OverflowBarAlignment? actionsOverflowAlignment,
    double? actionsOverflowButtonSpacing,
    VerticalDirection? actionsOverflowDirection,
    Clip clipBehavior = Clip.none,
    TextStyle? contentTextStyle,
    Color? iconColor,
    Curve insetAnimationCurve = Curves.decelerate,
    Duration insetAnimationDuration = const Duration(milliseconds: 100),
    ScrollController? scrollController,
    Color? surfaceTintColor,
    TextStyle? titleTextStyle,
    String? okButtonLabel,
    String? cancelButtonLabel,
    VoidCallback? onOkButtonPressed,
    bool isDefaultOkButtonIOS = false,
    bool isDestructiveCancelButtonIOS = false,
    bool isDestuctiveOkButtonIOS = false,
  });

  Future<DateTime?> showAdaptiveDatePicker(
    BuildContext context, {
    required DateTime initialDateTime,
    required DateTime minimumDate,
    required DateTime maximumDate,
    AdaptiveDatePickerMode mode,
    String? id,
    DatePickerDateOrder? dateOrderIOS,
    int minimumYearIOS,
    int? maximumYearIOS,
    bool use24hFormatIOS,
    bool showDayOfWeekIOS,
    int minuteIntervalIOS,
    double itemExtentIOS,
    TextInputType? keyboardTypeAndroid,
    String? cancelTextAndroid,
    String? confirmTextAndroid,
    String? errorFormatTextAndroid,
    String? errorInvalidTextAndroid,
    String? fieldHintTextAndroid,
    String? fieldLabelTextAndroid,
    String? helpTextAndroid,
    String? hourLabelTextAndroid,
    String? minuteLabelTextAndroid,
    DatePickerMode initialCalendarModeAndroid,
    DatePickerEntryMode datePickerInitialEntryMode,
    TimePickerEntryMode timePickerInitialEntryMode,
    void Function(DatePickerEntryMode)? onDatePickerModeChangeAndroid,
    void Function(TimePickerEntryMode)? onEntryModeChangedAndroid,
    bool Function(DateTime)? selectableDayPredicateAndroid,
    Icon? switchToCalendarEntryModeIconAndroid,
    Icon? switchToInputEntryModeIconAndroid,
    Orientation? orientationAndroid,
  });

  Future<int?> showAdaptivePicker(BuildContext context, {required List<Widget> children, Widget? title, String? okButtonLabel, String? cancelButtonLabel});

  Future<void> showUpdateAvailableDialog(BuildContext context, {String? androidPackageName, String? iOSAppId, String? huaweiAppId, bool isForceUpdate = false, bool iosLaunchIntune = false, String? title, String? message});

  Future<ImageSourceType?> showImageSourcePicker(BuildContext context);

  void hidePopup<T>({String? id, T? result});

  void hideAllPopups();

  bool isPopupOpen({required String id});
}

/// A [FLPopupManager] manages all popups
class FLPopupManager implements IFLPopupManager {
  FLPopupManager({required GlobalKey<NavigatorState> navigatorKey}) : _navigatorKey = navigatorKey;
  final GlobalKey<NavigatorState> _navigatorKey;

  NavigatorState get _navigator {
    final state = _navigatorKey.currentState;
    assert(state != null, 'Navigator with provided key: $_navigatorKey was not found in the widget tree');
    return state!;
  }

  final _popupRoutes = <IFLPopupController>[];

  static const double _defaultScrollControlDisabledMaxHeightRatio = 9.0 / 16.0;

  BuildContext get _navigatorContext => _navigator.context;

  /// Shows loader dialog
  /// Provide [id] id if you have multiple loaders and want to close a specific one
  @override
  void showLoader(
    BuildContext context, {
    String? id,
    bool barrierDismissible = false,
    WidgetBuilder? widgetBuilder,
  }) {
    assert(
      id == null || _popupRoutes.where((element) => element.id == id).isEmpty,
      'There is already a loader showing with id: $id',
    );

    final route = LoaderRoute._(
      id: id,
      context: context,
      builder: widgetBuilder ??
          (BuildContext context) => switch (context.theme.platform) {
                TargetPlatform.iOS || TargetPlatform.macOS => Center(
                    child: Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const CupertinoActivityIndicator(),
                    ),
                  ),
                _ => PopScope(
                    canPop: false,
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const CircularProgressIndicator(),
                      ),
                    ),
                  ),
              },
      onCompleted: _onCompleted,
    );

    _popupRoutes.add(route);
    _navigator.push(route);
  }

  /// Shows modal bottom sheet
  @override
  Future<T?> showModalBottomSheet<T>(
    BuildContext context, {
    required WidgetBuilder builder,
    String? id,
    Color? backgroundColor,
    String? barrierLabel,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    Color? barrierColor,
    bool isScrollControlled = false,
    double scrollControlDisabledMaxHeightRatio = _defaultScrollControlDisabledMaxHeightRatio,
    bool isDismissible = true,
    bool enableDrag = true,
    bool? showDragHandle,
    bool useSafeArea = false,
    RouteSettings? routeSettings,
    AnimationController? transitionAnimationController,
    Offset? anchorPoint,
  }) {
    assert(
      id == null || _popupRoutes.where((element) => element.id == id).isEmpty,
      'There is already a loader showing with id: $id',
    );

    assert(debugCheckHasMediaQuery(context), 'No MediaQuery widget found.');
    assert(debugCheckHasMaterialLocalizations(context), 'No MaterialLocalizations widget found.');

    final localizations = MaterialLocalizations.of(context);

    final route = BSheetRoute<T>._(
      id: id,
      builder: builder,
      capturedThemes: InheritedTheme.capture(from: context, to: _navigatorContext),
      isScrollControlled: isScrollControlled,
      scrollControlDisabledMaxHeightRatio: scrollControlDisabledMaxHeightRatio,
      barrierLabel: barrierLabel ?? localizations.scrimLabel,
      barrierOnTapHint: localizations.scrimOnTapHint(localizations.bottomSheetLabel),
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape,
      clipBehavior: clipBehavior,
      constraints: constraints,
      isDismissible: isDismissible,
      modalBarrierColor: barrierColor ?? Theme.of(context).bottomSheetTheme.modalBarrierColor,
      enableDrag: enableDrag,
      showDragHandle: showDragHandle,
      settings: routeSettings,
      transitionAnimationController: transitionAnimationController,
      anchorPoint: anchorPoint,
      useSafeArea: useSafeArea,
      onCompleted: _onCompleted,
    );

    _popupRoutes.add(route);
    _navigator.push(route);
    return route.completer.future;
  }

  /// Shows material dialog
  @override
  Future<T?> showDialog<T>(
    BuildContext context, {
    required WidgetBuilder builder,
    String? id,
    bool barrierDismissible = true,
    Color? barrierColor,
    String? barrierLabel,
    bool useSafeArea = true,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
    TraversalEdgeBehavior? traversalEdgeBehavior,
  }) {
    assert(
      id == null || _popupRoutes.where((element) => element.id == id).isEmpty,
      'There is already a loader showing with id: $id',
    );

    assert(debugCheckHasMaterialLocalizations(context), 'No MaterialLocalizations widget found.');

    final localizations = MaterialLocalizations.of(context);

    final route = DRoute<T>._(
      id: id,
      builder: builder,
      context: context,
      themes: InheritedTheme.capture(from: context, to: _navigatorContext),
      barrierColor: barrierColor ?? Theme.of(context).dialogTheme.barrierColor ?? Colors.black54,
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel ?? localizations.dialogLabel,
      useSafeArea: useSafeArea,
      settings: routeSettings,
      anchorPoint: anchorPoint,
      traversalEdgeBehavior: traversalEdgeBehavior ?? TraversalEdgeBehavior.closedLoop,
      onCompleted: _onCompleted,
    );

    _popupRoutes.add(route);
    _navigator.push(route);
    return route.completer.future;
  }

  /// Shows cupertino dialog
  @override
  Future<T?> showCupertinoDialog<T>(
    BuildContext context, {
    required WidgetBuilder builder,
    String? id,
    String? barrierLabel,
    bool barrierDismissible = false,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
  }) {
    assert(
      id == null || _popupRoutes.where((element) => element.id == id).isEmpty,
      'There is already a loader showing with id: $id',
    );

    final route = CPDialogRoute<T>._(
      context: context,
      builder: builder,
      id: id,
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel,
      barrierColor: CupertinoDynamicColor.resolve(kCupertinoModalBarrierColor, context),
      settings: routeSettings,
      anchorPoint: anchorPoint,
      onCompleted: _onCompleted,
    );

    _popupRoutes.add(route);
    _navigator.push(route);
    return route.completer.future;
  }

  /// Shows adaptive info dialog
  @override
  Future<void> showAdaptiveInfoDialog(
    BuildContext context, {
    String? id,
    String? barrierLabel,
    Key? key,
    bool? barrierDismissible,
    bool closableWithBackButtonAndroid = true,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
    TraversalEdgeBehavior? traversalEdgeBehavior,
    Color? barrierColor,
    bool useSafeArea = true,
    Widget? title,
    Widget? content,
    EdgeInsetsGeometry? contentPadding,
    EdgeInsetsGeometry? actionsPadding,
    EdgeInsetsGeometry? titlePadding,
    EdgeInsetsGeometry? iconPadding,
    EdgeInsetsGeometry? buttonPadding,
    EdgeInsets? insetPadding,
    AlignmentGeometry? alignment,
    Widget? icon,
    ShapeBorder? shape,
    double? elevation,
    Color? backgroundColor,
    Color? shadowColor,
    MainAxisAlignment? actionsAlignment,
    bool scrollable = false,
    ScrollController? actionScrollController,
    String? semanticLabel,
    OverflowBarAlignment? actionsOverflowAlignment,
    double? actionsOverflowButtonSpacing,
    VerticalDirection? actionsOverflowDirection,
    Clip clipBehavior = Clip.none,
    TextStyle? contentTextStyle,
    Color? iconColor,
    Curve insetAnimationCurve = Curves.decelerate,
    Duration insetAnimationDuration = const Duration(milliseconds: 100),
    ScrollController? scrollController,
    Color? surfaceTintColor,
    TextStyle? titleTextStyle,
    String? okButtonLabel,
    VoidCallback? onOkButtonPressed,
  }) {
    final routeId = id ?? UniqueKey().toString();
    Widget alertDialogBuilder(BuildContext context) {
      final iosButtons = [
        CupertinoDialogAction(
          onPressed: onOkButtonPressed ?? () => hidePopup<void>(id: routeId),
          child: Text(okButtonLabel ?? MaterialLocalizations.of(context).okButtonLabel),
        ),
      ];

      final androidButtons = [
        FilledButton(
          onPressed: onOkButtonPressed ?? () => hidePopup<void>(id: routeId),
          child: Text(okButtonLabel ?? MaterialLocalizations.of(context).okButtonLabel),
        ),
      ];
      final dialog = AlertDialog.adaptive(
        title: title,
        content: content,
        contentPadding: contentPadding,
        alignment: alignment,
        icon: icon,
        insetPadding: insetPadding ?? const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
        key: key,
        shape: shape,
        titlePadding: titlePadding,
        actionsPadding: actionsPadding,
        elevation: elevation,
        backgroundColor: backgroundColor,
        shadowColor: shadowColor,
        iconPadding: iconPadding,
        buttonPadding: buttonPadding,
        actionsAlignment: actionsAlignment,
        scrollable: scrollable,
        actionScrollController: actionScrollController,
        semanticLabel: semanticLabel,
        actionsOverflowAlignment: actionsOverflowAlignment,
        actionsOverflowButtonSpacing: actionsOverflowButtonSpacing,
        actionsOverflowDirection: actionsOverflowDirection,
        clipBehavior: clipBehavior,
        contentTextStyle: contentTextStyle,
        iconColor: iconColor,
        insetAnimationCurve: insetAnimationCurve,
        insetAnimationDuration: insetAnimationDuration,
        scrollController: scrollController,
        surfaceTintColor: surfaceTintColor,
        titleTextStyle: titleTextStyle,
        actions: switch (context.theme.platform) {
          TargetPlatform.iOS || TargetPlatform.macOS => iosButtons,
          _ => androidButtons,
        },
      );
      if (closableWithBackButtonAndroid) {
        return dialog;
      } else {
        return PopScope(
          canPop: false,
          child: dialog,
        );
      }
    }

    return switch (context.theme.platform) {
      TargetPlatform.iOS || TargetPlatform.macOS => showCupertinoDialog<void>(
          context,
          builder: (context) => CupertinoTheme(
            data: const CupertinoThemeData(),
            child: alertDialogBuilder(context),
          ),
          id: routeId,
          barrierLabel: barrierLabel,
          barrierDismissible: barrierDismissible ?? false,
          routeSettings: routeSettings,
          anchorPoint: anchorPoint,
        ),
      _ => showDialog<void>(
          context,
          builder: alertDialogBuilder,
          id: routeId,
          barrierDismissible: barrierDismissible ?? true,
          barrierColor: barrierColor,
          barrierLabel: barrierLabel,
          useSafeArea: useSafeArea,
          routeSettings: routeSettings,
          anchorPoint: anchorPoint,
          traversalEdgeBehavior: traversalEdgeBehavior,
        ),
    };
  }

  /// Shows default adaptive alert dialog
  @override
  Future<T?> showDefaultAdaptiveAlertDialog<T>(
    BuildContext context, {
    String? id,
    String? barrierLabel,
    Key? key,
    bool? barrierDismissible,
    bool closableWithBackButtonAndroid = true,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
    TraversalEdgeBehavior? traversalEdgeBehavior,
    Color? barrierColor,
    bool useSafeArea = true,
    Widget? title,
    Widget? content,
    bool reversedActions = false,
    EdgeInsetsGeometry? contentPadding,
    EdgeInsetsGeometry? actionsPadding,
    EdgeInsetsGeometry? titlePadding,
    EdgeInsetsGeometry? iconPadding,
    EdgeInsetsGeometry? buttonPadding,
    EdgeInsets? insetPadding,
    AlignmentGeometry? alignment,
    Widget? icon,
    ShapeBorder? shape,
    double? elevation,
    Color? backgroundColor,
    Color? shadowColor,
    MainAxisAlignment? actionsAlignment,
    bool scrollable = false,
    ScrollController? actionScrollController,
    String? semanticLabel,
    OverflowBarAlignment? actionsOverflowAlignment,
    double? actionsOverflowButtonSpacing,
    VerticalDirection? actionsOverflowDirection,
    Clip clipBehavior = Clip.none,
    TextStyle? contentTextStyle,
    Color? iconColor,
    Curve insetAnimationCurve = Curves.decelerate,
    Duration insetAnimationDuration = const Duration(milliseconds: 100),
    ScrollController? scrollController,
    Color? surfaceTintColor,
    TextStyle? titleTextStyle,
    String? okButtonLabel,
    String? cancelButtonLabel,
    VoidCallback? onOkButtonPressed,
    bool isDefaultOkButtonIOS = false,
    bool isDestructiveCancelButtonIOS = false,
    bool isDestuctiveOkButtonIOS = false,
  }) {
    Widget alertDialogBuilder(BuildContext context) {
      var iosButtons = [
        CupertinoDialogAction(
          onPressed: () {
            hidePopup<void>(id: id);
          },
          isDestructiveAction: isDestructiveCancelButtonIOS,
          child: Text(cancelButtonLabel ?? MaterialLocalizations.of(context).cancelButtonLabel),
        ),
        CupertinoDialogAction(
          onPressed: onOkButtonPressed,
          isDefaultAction: isDefaultOkButtonIOS,
          isDestructiveAction: isDestuctiveOkButtonIOS,
          child: Text(okButtonLabel ?? MaterialLocalizations.of(context).okButtonLabel),
        ),
      ];

      var androidButtons = [
        TextButton(
          onPressed: () => hidePopup<void>(id: id),
          child: Text(cancelButtonLabel ?? MaterialLocalizations.of(context).cancelButtonLabel),
        ),
        FilledButton(
          onPressed: onOkButtonPressed,
          child: Text(okButtonLabel ?? MaterialLocalizations.of(context).okButtonLabel),
        ),
      ];

      if (reversedActions) {
        iosButtons = iosButtons.reversed.toList();
        androidButtons = androidButtons.reversed.toList();
      }
      final dialog = AlertDialog.adaptive(
        title: title,
        content: content,
        contentPadding: contentPadding,
        alignment: alignment,
        icon: icon,
        insetPadding: insetPadding ?? const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
        key: key,
        shape: shape,
        titlePadding: titlePadding,
        actionsPadding: actionsPadding,
        elevation: elevation,
        backgroundColor: backgroundColor,
        shadowColor: shadowColor,
        iconPadding: iconPadding,
        buttonPadding: buttonPadding,
        actionsAlignment: actionsAlignment,
        scrollable: scrollable,
        actionScrollController: actionScrollController,
        semanticLabel: semanticLabel,
        actionsOverflowAlignment: actionsOverflowAlignment,
        actionsOverflowButtonSpacing: actionsOverflowButtonSpacing,
        actionsOverflowDirection: actionsOverflowDirection,
        clipBehavior: clipBehavior,
        contentTextStyle: contentTextStyle,
        iconColor: iconColor,
        insetAnimationCurve: insetAnimationCurve,
        insetAnimationDuration: insetAnimationDuration,
        scrollController: scrollController,
        surfaceTintColor: surfaceTintColor,
        titleTextStyle: titleTextStyle,
        actions: switch (context.theme.platform) {
          TargetPlatform.iOS || TargetPlatform.macOS => iosButtons,
          _ => androidButtons,
        },
      );
      if (closableWithBackButtonAndroid) {
        return dialog;
      } else {
        return PopScope(
          canPop: false,
          child: dialog,
        );
      }
    }

    return switch (context.theme.platform) {
      TargetPlatform.iOS || TargetPlatform.macOS => showCupertinoDialog<T>(
          context,
          builder: (context) => CupertinoTheme(
            data: const CupertinoThemeData(),
            child: alertDialogBuilder(context),
          ),
          id: id,
          barrierLabel: barrierLabel,
          barrierDismissible: barrierDismissible ?? false,
          routeSettings: routeSettings,
          anchorPoint: anchorPoint,
        ),
      _ => showDialog<T>(
          context,
          builder: alertDialogBuilder,
          id: id,
          barrierDismissible: barrierDismissible ?? true,
          barrierColor: barrierColor,
          barrierLabel: barrierLabel,
          useSafeArea: useSafeArea,
          routeSettings: routeSettings,
          anchorPoint: anchorPoint,
          traversalEdgeBehavior: traversalEdgeBehavior,
        ),
    };
  }

  /// Shows adaptive date picker
  @override
  Future<DateTime?> showAdaptiveDatePicker(
    BuildContext context, {
    required DateTime initialDateTime,
    required DateTime minimumDate,
    required DateTime maximumDate,
    AdaptiveDatePickerMode mode = AdaptiveDatePickerMode.date,
    String? id,
    DatePickerDateOrder? dateOrderIOS,
    int minimumYearIOS = 1,
    int? maximumYearIOS,
    bool use24hFormatIOS = true,
    bool showDayOfWeekIOS = false,
    int minuteIntervalIOS = 1,
    double itemExtentIOS = 32,
    TextInputType? keyboardTypeAndroid,
    String? cancelTextAndroid,
    String? confirmTextAndroid,
    String? errorFormatTextAndroid,
    String? errorInvalidTextAndroid,
    String? fieldHintTextAndroid,
    String? fieldLabelTextAndroid,
    String? helpTextAndroid,
    String? hourLabelTextAndroid,
    String? minuteLabelTextAndroid,
    DatePickerMode initialCalendarModeAndroid = DatePickerMode.day,
    DatePickerEntryMode datePickerInitialEntryMode = DatePickerEntryMode.calendar,
    TimePickerEntryMode timePickerInitialEntryMode = TimePickerEntryMode.dial,
    void Function(DatePickerEntryMode)? onDatePickerModeChangeAndroid,
    void Function(TimePickerEntryMode)? onEntryModeChangedAndroid,
    bool Function(DateTime)? selectableDayPredicateAndroid,
    Icon? switchToCalendarEntryModeIconAndroid,
    Icon? switchToInputEntryModeIconAndroid,
    Orientation? orientationAndroid,
  }) {
    var selectedDate = initialDateTime;

    return switch (context.theme.platform) {
      TargetPlatform.iOS || TargetPlatform.macOS => showCupertinoModalPopup<DateTime>(
          context,
          id: id,
          builder: (context) => CupertinoTheme(
            data: CupertinoThemeData(brightness: context.theme.brightness),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: context.brightness == Brightness.light ? const Color.fromARGB(255, 242, 242, 248) : const Color.fromARGB(255, 82, 81, 81),
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: CupertinoButton(
                      child: Text(
                        MaterialLocalizations.of(context).okButtonLabel,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () => hidePopup(id: id, result: selectedDate),
                    ),
                  ),
                ),
                Container(
                  color: context.brightness == Brightness.light ? CupertinoColors.lightBackgroundGray : CupertinoColors.darkBackgroundGray,
                  height: 260,
                  child: SafeArea(
                    top: false,
                    child: CupertinoDatePicker(
                      onDateTimeChanged: (DateTime value) {
                        selectedDate = value;
                      },
                      dateOrder: dateOrderIOS,
                      initialDateTime: initialDateTime,
                      minimumDate: minimumDate,
                      maximumDate: maximumDate,
                      minimumYear: minimumYearIOS,
                      maximumYear: maximumYearIOS,
                      use24hFormat: use24hFormatIOS,
                      showDayOfWeek: showDayOfWeekIOS,
                      minuteInterval: minuteIntervalIOS,
                      mode: mode.toCupertinoDatePickerMode,
                      itemExtent: itemExtentIOS,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      _ => _showMaterialDateAndTimePickerConsecutively(
          context: context,
          mode: mode,
          id: id,
          initialDateTime: initialDateTime,
          minimumDate: minimumDate,
          maximumDate: maximumDate,
          initialCalendarModeAndroid: initialCalendarModeAndroid,
          datePickerInitialEntryModeAndroid: datePickerInitialEntryMode,
          timePickerInitialEntryModeAndroid: timePickerInitialEntryMode,
          helpTextAndroid: helpTextAndroid,
          hourLabelTextAndroid: hourLabelTextAndroid,
          minuteLabelTextAndroid: minuteLabelTextAndroid,
          errorFormatTextAndroid: errorFormatTextAndroid,
          errorInvalidTextAndroid: errorInvalidTextAndroid,
          fieldHintTextAndroid: fieldHintTextAndroid,
          fieldLabelTextAndroid: fieldLabelTextAndroid,
          confirmTextAndroid: confirmTextAndroid,
          cancelTextAndroid: cancelTextAndroid,
          keyboardTypeAndroid: keyboardTypeAndroid,
          onDatePickerModeChangeAndroid: onDatePickerModeChangeAndroid,
          selectableDayPredicateAndroid: selectableDayPredicateAndroid,
          switchToCalendarEntryModeIconAndroid: switchToCalendarEntryModeIconAndroid,
          switchToInputEntryModeIconAndroid: switchToInputEntryModeIconAndroid,
          orientationAndroid: orientationAndroid,
          onEntryModeChangedAndroid: onEntryModeChangedAndroid,
        ),
    };
  }

  /// Shows cupertino modal popup
  @override
  Future<T?> showCupertinoModalPopup<T>(
    BuildContext context, {
    required WidgetBuilder builder,
    String? id,
    ImageFilter? filter,
    Color barrierColor = kCupertinoModalBarrierColor,
    bool barrierDismissible = true,
    bool semanticsDismissible = false,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
  }) {
    assert(
      id == null || _popupRoutes.where((element) => element.id == id).isEmpty,
      'There is already a loader showing with id: $id',
    );

    final route = CPModalPopupRoute<T>._(
      builder: builder,
      id: id,
      filter: filter,
      barrierColor: CupertinoDynamicColor.resolve(barrierColor, context),
      barrierDismissible: barrierDismissible,
      semanticsDismissible: semanticsDismissible,
      settings: routeSettings,
      anchorPoint: anchorPoint,
      onCompleted: _onCompleted,
    );
    _popupRoutes.add(route);

    _navigator.push(route);
    return route.completer.future;
  }

  /// In android shows date picker first then time picker if [mode] is [AdaptiveDatePickerMode.dateAndTime]
  ///
  /// In android shows date picker if [mode] is [AdaptiveDatePickerMode.date]
  ///
  /// In android shows time picker if [mode] is [AdaptiveDatePickerMode.time]
  Future<DateTime?> _showMaterialDateAndTimePickerConsecutively({
    required DateTime initialDateTime,
    required DateTime minimumDate,
    required DateTime maximumDate,
    required DatePickerMode initialCalendarModeAndroid,
    required DatePickerEntryMode datePickerInitialEntryModeAndroid,
    required TimePickerEntryMode timePickerInitialEntryModeAndroid,
    required AdaptiveDatePickerMode mode,
    required BuildContext context,
    String? id,
    TextInputType? keyboardTypeAndroid,
    String? cancelTextAndroid,
    String? confirmTextAndroid,
    String? errorFormatTextAndroid,
    String? errorInvalidTextAndroid,
    String? fieldHintTextAndroid,
    String? fieldLabelTextAndroid,
    String? helpTextAndroid,
    String? hourLabelTextAndroid,
    String? minuteLabelTextAndroid,
    void Function(DatePickerEntryMode)? onDatePickerModeChangeAndroid,
    void Function(TimePickerEntryMode)? onEntryModeChangedAndroid,
    bool Function(DateTime)? selectableDayPredicateAndroid,
    Icon? switchToCalendarEntryModeIconAndroid,
    Icon? switchToInputEntryModeIconAndroid,
    Orientation? orientationAndroid,
  }) async {
    switch (mode) {
      case AdaptiveDatePickerMode.date:
        return showDialog<DateTime>(
          context,
          id: id,
          builder: (context) => DatePickerDialog(
            firstDate: minimumDate,
            lastDate: maximumDate,
            currentDate: initialDateTime,
            initialDate: initialDateTime,
            keyboardType: keyboardTypeAndroid,
            cancelText: cancelTextAndroid,
            confirmText: confirmTextAndroid,
            errorFormatText: errorFormatTextAndroid,
            errorInvalidText: errorInvalidTextAndroid,
            fieldHintText: fieldHintTextAndroid,
            fieldLabelText: fieldLabelTextAndroid,
            helpText: helpTextAndroid,
            initialCalendarMode: initialCalendarModeAndroid,
            initialEntryMode: datePickerInitialEntryModeAndroid,
            onDatePickerModeChange: onDatePickerModeChangeAndroid,
            selectableDayPredicate: selectableDayPredicateAndroid,
            switchToCalendarEntryModeIcon: switchToCalendarEntryModeIconAndroid,
            switchToInputEntryModeIcon: switchToInputEntryModeIconAndroid,
          ),
        );
      case AdaptiveDatePickerMode.time:
        final time = await showDialog<TimeOfDay>(
          context,
          builder: (context) => TimePickerDialog(
            initialTime: TimeOfDay.fromDateTime(initialDateTime),
            orientation: orientationAndroid,
            initialEntryMode: timePickerInitialEntryModeAndroid,
            errorInvalidText: errorInvalidTextAndroid,
            helpText: helpTextAndroid,
            confirmText: confirmTextAndroid,
            cancelText: cancelTextAndroid,
            hourLabelText: hourLabelTextAndroid,
            minuteLabelText: minuteLabelTextAndroid,
            onEntryModeChanged: onEntryModeChangedAndroid,
          ),
        );
        if (time == null) return null;
        final now = DateTime.now();

        return DateTime(now.year, now.month, now.day, time.hour, time.minute);

      case AdaptiveDatePickerMode.dateAndTime:
        final date = await showDialog<DateTime>(
          context,
          builder: (context) => DatePickerDialog(
            firstDate: minimumDate,
            lastDate: maximumDate,
            currentDate: initialDateTime,
            initialDate: initialDateTime,
            keyboardType: keyboardTypeAndroid,
            cancelText: cancelTextAndroid,
            confirmText: confirmTextAndroid,
            errorFormatText: errorFormatTextAndroid,
            errorInvalidText: errorInvalidTextAndroid,
            fieldHintText: fieldHintTextAndroid,
            fieldLabelText: fieldLabelTextAndroid,
            helpText: helpTextAndroid,
            initialCalendarMode: initialCalendarModeAndroid,
            initialEntryMode: datePickerInitialEntryModeAndroid,
            onDatePickerModeChange: onDatePickerModeChangeAndroid,
            selectableDayPredicate: selectableDayPredicateAndroid,
            switchToCalendarEntryModeIcon: switchToCalendarEntryModeIconAndroid,
            switchToInputEntryModeIcon: switchToInputEntryModeIconAndroid,
          ),
        );
        if (date == null || !context.mounted) return null;
        final time = await showDialog<TimeOfDay>(
          context,
          builder: (context) => TimePickerDialog(
            initialTime: TimeOfDay.fromDateTime(initialDateTime),
            orientation: orientationAndroid,
            initialEntryMode: timePickerInitialEntryModeAndroid,
            errorInvalidText: errorInvalidTextAndroid,
            helpText: helpTextAndroid,
            confirmText: confirmTextAndroid,
            cancelText: cancelTextAndroid,
            hourLabelText: hourLabelTextAndroid,
            minuteLabelText: minuteLabelTextAndroid,
            onEntryModeChanged: onEntryModeChangedAndroid,
          ),
        );
        if (time == null) return null;
        return DateTime(date.year, date.month, date.day, time.hour, time.minute);
    }
  }

  @override
  Future<int?> showAdaptivePicker(
    BuildContext context, {
    required List<Widget> children,
    Widget? title,
    String? okButtonLabel,
    String? cancelButtonLabel,
    int? initialItemIndex,
    double androidHeight = 360,
    double iosHeight = 300,
  }) async {
    if (children.isEmpty) throw Exception('Children list of picker cannot be empty');

    final backgroundColor = context.theme.brightness == Brightness.light ? Colors.white : CupertinoColors.darkBackgroundGray;
    var selectedItemIndex = initialItemIndex;
    final androidScrollController = ScrollController();
    final id = UniqueKey().toString();
    return switch (context.theme.platform) {
      TargetPlatform.iOS || TargetPlatform.macOS => showModalBottomSheet<int>(
          context,
          id: id,
          builder: (context) => CupertinoTheme(
            data: CupertinoThemeData(brightness: context.theme.brightness),
            child: Container(
              color: backgroundColor,
              height: iosHeight,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: title != null
                                ? DefaultTextStyle(
                                    style: context.textTheme.headlineSmall!,
                                    child: title,
                                  )
                                : CupertinoButton(
                                    child: Text(cancelButtonLabel ?? MaterialLocalizations.of(context).cancelButtonLabel),
                                    onPressed: () => hidePopup<int>(id: id),
                                  ),
                          ),
                        ),
                        CupertinoButton(
                          child: Text(okButtonLabel ?? MaterialLocalizations.of(context).okButtonLabel),
                          onPressed: () => hidePopup<int>(id: id, result: selectedItemIndex ?? 0),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SafeArea(
                      child: CupertinoPicker(
                        scrollController: FixedExtentScrollController(initialItem: selectedItemIndex ?? 0),
                        itemExtent: 40,
                        onSelectedItemChanged: (value) => selectedItemIndex = value,
                        children: children
                            .map(
                              (element) => Center(
                                child: element,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      _ => showDialog(
          context,
          id: id,
          builder: (context) => StatefulBuilder(
            builder: (context, updateCallback) {
              return Dialog(
                insetPadding: const EdgeInsets.symmetric(
                  horizontal: 36,
                  vertical: 18,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: androidHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (title != null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: DefaultTextStyle(
                                  style: context.textTheme.headlineSmall!,
                                  child: title,
                                ),
                              ),
                              const Divider(),
                            ],
                          ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Scrollbar(
                              interactive: true,
                              radius: context.theme.scrollbarTheme.radius ?? const Radius.circular(4),
                              controller: androidScrollController,
                              child: SingleChildScrollView(
                                controller: androidScrollController,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    for (int i = 0; i < children.length; i++)
                                      RadioListTile(
                                        title: children[i],
                                        value: selectedItemIndex,
                                        groupValue: i,
                                        onChanged: (value) {
                                          updateCallback(() {
                                            selectedItemIndex = i;
                                          });
                                        },
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () => hidePopup<int>(id: id),
                                child: Text(cancelButtonLabel ?? MaterialLocalizations.of(context).cancelButtonLabel),
                              ),
                              TextButton(
                                onPressed: selectedItemIndex == null ? null : () => hidePopup<int>(id: id, result: selectedItemIndex),
                                child: Text(okButtonLabel ?? MaterialLocalizations.of(context).okButtonLabel),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
    };
  }

  @override
  Future<void> showUpdateAvailableDialog(
    BuildContext context, {
    String? androidPackageName,
    String? iOSAppId,
    String? huaweiAppId,
    bool isForceUpdate = false,
    bool iosLaunchIntune = false,
    String? title,
    String? message,
  }) async {
    final languageCode = context.locale.languageCode;
    final updateLabel = languageCode == 'tr' ? 'Güncelle' : 'Update';
    final dismissLabel = languageCode == 'tr' ? 'Daha sonra' : 'Later';
    final updateAvailableLabel = languageCode == 'tr' ? 'Güncelleme Mevcut' : 'Update Available';
    final forceUpdateMessage = languageCode == 'tr' ? 'Uygulamayı kullanabilmek için lütfen son sürüme güncelleyin.' : 'Please update to the latest version to use the application.';
    final optionalUpdateMessage = languageCode == 'tr' ? 'Uygulamanın yeni sürümü mevcut. Güncellemek ister misiniz?' : 'The new version of the application is available. Do you want to update?';

    final id = UniqueKey().toString();
    final currentContext = context;

    return switch (currentContext.theme.platform) {
      TargetPlatform.iOS || TargetPlatform.macOS => showCupertinoDialog<void>(
          context,
          id: id,
          builder: (context) => CupertinoTheme(
            data: CupertinoThemeData(brightness: context.theme.brightness),
            child: CupertinoAlertDialog(
              title: Text(title ?? updateAvailableLabel),
              content: Text(
                message ?? (isForceUpdate ? forceUpdateMessage : optionalUpdateMessage),
              ),
              actions: isForceUpdate
                  ? [
                      CupertinoDialogAction(
                        onPressed: () => FLCore().updateApp(
                          androidPackageName: androidPackageName,
                          iOSAppId: iOSAppId,
                        ),
                        child: Text(updateLabel),
                      ),
                    ]
                  : [
                      CupertinoDialogAction(
                        onPressed: () => hidePopup<void>(id: id),
                        isDestructiveAction: true,
                        child: Text(dismissLabel),
                      ),
                      CupertinoDialogAction(
                        onPressed: () => FLCore().updateApp(
                          androidPackageName: androidPackageName,
                          iOSAppId: iOSAppId,
                        ),
                        isDefaultAction: true,
                        child: Text(updateLabel),
                      ),
                    ],
            ),
          ),
        ),
      _ => showDialog<void>(
          context,
          id: id,
          barrierDismissible: !isForceUpdate,
          builder: (context) => PopScope(
            canPop: !isForceUpdate,
            child: AlertDialog(
              title: Text(title ?? updateAvailableLabel),
              content: Text(
                message ?? (isForceUpdate ? forceUpdateMessage : optionalUpdateMessage),
              ),
              actions: isForceUpdate
                  ? [
                      TextButton(
                        onPressed: () => FLCore().updateApp(
                          androidPackageName: androidPackageName,
                          iOSAppId: iOSAppId,
                        ),
                        child: Text(updateLabel),
                      ),
                    ]
                  : [
                      TextButton(
                        onPressed: () => hidePopup<void>(id: id),
                        child: Text(dismissLabel),
                      ),
                      FilledButton(
                        onPressed: () => FLCore().updateApp(
                          androidPackageName: androidPackageName,
                          iOSAppId: iOSAppId,
                        ),
                        child: Text(updateLabel),
                      ),
                    ],
            ),
          ),
        ),
    };
  }

  /// Shows image source options
  ///
  /// Dialog on Android and ActionSheet on iOS
  @override
  Future<ImageSourceType?> showImageSourcePicker(BuildContext context) async {
    final id = UniqueKey().toString();
   
   final languageCode = context.locale.languageCode;
    return switch (context.theme.platform) {
      TargetPlatform.iOS || TargetPlatform.macOS => showCupertinoModalPopup(
         context,
          id: id,
          builder: (context) => CupertinoTheme(
            data: CupertinoThemeData(brightness: context.theme.brightness),
            child: CupertinoActionSheet(
              title:  Text(languageCode == 'tr'? 'Resim Seç': 'Select Image'),
              message:  Text(languageCode == 'tr'? 'Lütfen bir resim kaynağı seçin': 'Please select an image source'),
              cancelButton: CupertinoActionSheetAction(
                onPressed: () => hidePopup<ImageSourceType>(id: id),
                isDestructiveAction: true,
                child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
              ),
              actions: [
                CupertinoActionSheetAction(
                  onPressed: () {
                    hidePopup<ImageSourceType>(
                      id: id,
                      result: ImageSourceType.camera,
                    );
                  },
                  child:  Text(languageCode == 'tr'?'Kameradan Çek': 'Take Photo'),
                ),
                CupertinoActionSheetAction(
                  onPressed: () {
                    hidePopup<ImageSourceType>(
                      id: id,
                      result: ImageSourceType.gallery,
                    );
                  },
                  child:  Text(languageCode == 'tr'?'Galeriden Seç': 'Choose from Gallery'),
                ),
              ],
            ),
          ),
        ),
      _ => showDialog(
          context,
          id: id,
          builder: (context) => Dialog(
            insetPadding: const EdgeInsets.symmetric(
              horizontal: 36,
              vertical: 18,
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 360),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: DefaultTextStyle(
                            style: context.textTheme.headlineSmall!,
                            child:  Text(languageCode == 'tr'?'Resim Kaynağı Seç': 'Select Image Source'),
                          ),
                        ),
                        const Divider(),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: const Icon(Icons.camera_alt_outlined),
                              title:  Text(languageCode == 'tr'?'Kameradan Çek': 'Take Photo'),
                              onTap: () {
                                hidePopup<ImageSourceType>(
                                  id: id,
                                  result: ImageSourceType.camera,
                                );
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.photo_outlined),
                              title:  Text(languageCode == 'tr'?'Galeriden Seç': 'Choose from Gallery'),
                              onTap: () {
                                hidePopup<ImageSourceType>(
                                  id: id,
                                  result: ImageSourceType.gallery,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FilledButton(
                            onPressed: () => hidePopup<ImageSourceType>(id: id),
                            child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
    };
  }

  /// Hides popup with given [id]
  ///
  /// If [id] is not provided hides latest one
  @override
  void hidePopup<T>({String? id, T? result}) {
    assert(
      id == null || _popupRoutes.where((element) => element.id == id).isNotEmpty,
      'Tried to close loader with id: $id which does not exist',
    );

    if (id == null) {
      final removedR = _popupRoutes.removeLast() as Route;

      (removedR as IFLPopupController).completer.complete(result);

      if (removedR.isCurrent) {
        _navigator.pop();
      } else {
        _navigator.removeRoute(removedR);
      }

      return;
    }
    final routeIndex = _popupRoutes.indexWhere((element) => element.id == id);
    final removedR = _popupRoutes.removeAt(routeIndex) as Route;

    (removedR as IFLPopupController).completer.complete(result);

    if (removedR.isCurrent) {
      _navigator.pop();
    } else {
      _navigator.removeRoute(removedR);
    }
  }

  /// Hides all popups
  @override
  void hideAllPopups() {
    for (final route in _popupRoutes) {
      _navigator.removeRoute(route as Route);
    }
    _popupRoutes.clear();
  }

  void _onCompleted(IFLPopupController controller) {
    if (_popupRoutes.contains(controller)) _popupRoutes.remove(controller);
  }

  /// Checks if popup with given [id] is open
  @override
  bool isPopupOpen({required String id}) {
    return _popupRoutes.any((element) => element.id == id);
  }
}
