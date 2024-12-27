import 'package:flcore/flcore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const ButtonsExample(),
  );
}

class ButtonsExample extends StatelessWidget {
  const ButtonsExample({super.key});

  @override
  Widget build(BuildContext context) {
    const minButtonSize = Size(kMinInteractiveDimensionCupertino, kMinInteractiveDimensionCupertino);
    return MaterialApp(
      theme: ThemeData(
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            minimumSize: minButtonSize,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            minimumSize: minButtonSize,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            minimumSize: minButtonSize,
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            minimumSize: minButtonSize,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: minButtonSize,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FLTextButton(
                onPressed: () {},
                child: const Text('FL Adaptive Text Button'),
              ),
              verticalBox8,
              FLOutlinedButton(
                onPressed: () {},
                child: const Text('FL Adaptive Outlined Button'),
              ),
              verticalBox8,
              FLFilledButton(
                onPressed: () {},
                child: FLText.labelLarge(
                  'FL Adaptive Filled Button',
                  textColor: context.colorScheme.onPrimary,
                ),
              ),
              verticalBox8,
              FLIconButton.filled(
                onPressed: () {},
                icon: Icon(
                  Icons.add,
                  color: context.colorScheme.onPrimary,
                ),
              ),
              FLIconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete_forever,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
