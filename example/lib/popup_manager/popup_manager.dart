import 'package:flcore/flcore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

Future<void> main() async {
  await FLCore().initialize();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

final rootPopupManager = FLPopupManager(navigatorKey: navKey);
final navKey = GlobalKey<NavigatorState>();

class _MyAppState extends State<MyApp> {
  late final FlutterLocalization localization;

  @override
  void initState() {
    localization = FlutterLocalization.instance;
    localization.init(
      mapLocales: [
        const MapLocale(
          'tr',
          {},
        ),
      ],
      initLanguageCode: 'tr',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navKey,
      localizationsDelegates: localization.localizationsDelegates,
      supportedLocales: localization.supportedLocales,
      locale: localization.currentLocale,
      home: const PopupManagerWidget(),
    );
  }
}

class PopupManagerWidget extends StatefulWidget {
  const PopupManagerWidget({super.key});

  @override
  State<PopupManagerWidget> createState() => _PopupManagerWidgetState();
}

class _PopupManagerWidgetState extends State<PopupManagerWidget> {
  final popupManager = FLPopupManager(navigatorKey: navKey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Test Appbar Size'),
      ),
      body: Center(
        child: ListView(
          children: [
            FLTextButton(
              child: const Text('Show dialog'),
              onPressed: () {
                popupManager.showDialog<void>(
                  context,
                  builder: (context) => AlertDialog(
                    title: const Text('Title'),
                    content: const Text('Content'),
                    actions: [
                      TextButton(
                        onPressed: popupManager.hidePopup<void>,
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
            ),
            FLTextButton(
              child: const Text('Show loader'),
              onPressed: () {
                popupManager.showLoader(context);
                1.seconds.delay(popupManager.hidePopup<void>);
              },
            ),
            FLTextButton(
              child: const Text('Show bottom sheet'),
              onPressed: () {
                popupManager.showModalBottomSheet<void>(
                  context,
                  builder: (context) => ColoredBox(
                    color: Colors.white,
                    child: Center(
                      child: TextButton(
                        onPressed: popupManager.hidePopup<void>,
                        child: const Text('Close'),
                      ),
                    ),
                  ),
                );
              },
            ),
            FLTextButton(
              child: const Text('Show cupertino dialog'),
              onPressed: () {
                popupManager.showCupertinoDialog<void>(
                  context,
                  builder: (context) => Center(
                    child: CupertinoButton.filled(
                      onPressed: popupManager.hidePopup<void>,
                      child: const Text('OK'),
                    ),
                  ),
                );
              },
            ),
            FLTextButton(
              child: const Text('Show cupertino modal popup'),
              onPressed: () {
                popupManager.showCupertinoModalPopup<void>(
                  context,
                  builder: (context) => Container(
                    height: 300,
                    color: Colors.white,
                    child: Center(
                      child: CupertinoButton.filled(
                        onPressed: popupManager.hidePopup<void>,
                        child: const Text('Close'),
                      ),
                    ),
                  ),
                );
              },
            ),
            FLTextButton(
              child: const Text('Show adaptive info dialog'),
              onPressed: () {
                popupManager.showAdaptiveInfoDialog(
                  context,
                  title: const Text('Başarılı'),
                  content: const Text('İşlem başarılı bir şekilde gerçekleşti.'),
                );
              },
            ),
            FLTextButton(
              child: const Text('Show default adaptive alert dialog'),
              onPressed: () {
                popupManager.showDefaultAdaptiveAlertDialog<void>(
                  context,
                  content: const Text('Content'),
                  title: const Text('Title'),
                  onOkButtonPressed: popupManager.hidePopup<void>,
                );
              },
            ),
            FLTextButton(
              child: const Text('Show adaptive date picker'),
              onPressed: () async {
                final datePickerId = UniqueKey().toString();
                debugPrint(
                  (await popupManager.showAdaptiveDatePicker(
                    context,
                    id: datePickerId,
                    minimumDate: DateTime.now().subtract(5.days),
                    maximumDate: DateTime.now().add(5.days),
                    initialDateTime: DateTime.now(),
                    mode: AdaptiveDatePickerMode.dateAndTime,
                  ))
                      ?.toString(),
                );
              },
            ),
            FLTextButton(
              child: const Text('Show adaptive picker'),
              onPressed: () async {
                final index = await popupManager.showAdaptivePicker(
                  initialItemIndex: 3,
                  context,
                  androidHeight: double.infinity,
                  children: [
                    const Text('Item 1'),
                    const Text('Item 2'),
                    const Text('Item 3'),
                    const Text('Item 4'),
                    const Text('Item 5'),
                  ],
                  title: const Text('Seçim yapınız'),
                );
                if (kDebugMode) print(index);
              },
            ),
            FLTextButton(
              child: const Text('Show Update Available Dialog'),
              onPressed: () {
                popupManager.showUpdateAvailableDialog(
                  iosLaunchIntune: true,
                  context,
                );
              },
            ),
            FLTextButton(
              child: const Text('Show image source picker'),
              onPressed: () async {
                if (kDebugMode) {
                  print(await popupManager.showImageSourcePicker(context));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
