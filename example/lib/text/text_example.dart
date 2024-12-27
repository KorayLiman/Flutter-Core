import 'package:flcore/flcore.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FLTextExample());
}

class FLTextExample extends StatelessWidget {
  const FLTextExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ListView(
            children: const [
              FLText.displayLarge('Hello World', textAlign: TextAlign.center, textColor: Colors.red, fontWeight: FontWeight.bold),
              FLText.displayMedium('Hello World', textAlign: TextAlign.center, textColor: Colors.red, fontWeight: FontWeight.bold),
              FLText.displaySmall('Hello World', textAlign: TextAlign.center, textColor: Colors.red, fontWeight: FontWeight.bold),
              FLText.headlineLarge('Hello World', textAlign: TextAlign.center, textColor: Colors.red, fontWeight: FontWeight.bold),
              FLText.headlineMedium('Hello World', textAlign: TextAlign.center, textColor: Colors.red, fontWeight: FontWeight.bold),
              FLText.headlineSmall('Hello World', textAlign: TextAlign.center, textColor: Colors.red, fontWeight: FontWeight.bold),
              FLText.titleLarge('Hello World', textAlign: TextAlign.center, textColor: Colors.red, fontWeight: FontWeight.bold),
              FLText.titleMedium('Hello World', textAlign: TextAlign.center, textColor: Colors.red, fontWeight: FontWeight.bold),
              FLText.titleSmall('Hello World', textAlign: TextAlign.center, textColor: Colors.red, fontWeight: FontWeight.bold),
              FLText.bodyLarge('Hello World', textAlign: TextAlign.center, textColor: Colors.red, fontWeight: FontWeight.bold),
              FLText.bodyMedium('Hello World', textAlign: TextAlign.center, textColor: Colors.red, fontWeight: FontWeight.bold),
              FLText.bodySmall('Hello World', textAlign: TextAlign.center, textColor: Colors.red, fontWeight: FontWeight.bold),
              FLText.labelLarge('Hello World', textAlign: TextAlign.center, textColor: Colors.red, fontWeight: FontWeight.bold),
              FLText.labelMedium('Hello World', textAlign: TextAlign.center, textColor: Colors.red, fontWeight: FontWeight.bold),
              FLText.labelSmall('Hello World', textAlign: TextAlign.center, textColor: Colors.red, fontWeight: FontWeight.bold),
              verticalBox12,
              FLText.displayLarge('Hello World', textAlign: TextAlign.center, textColor: Colors.red, fontWeight: FontWeight.normal),
              FLText.displayMedium('Hello World', textAlign: TextAlign.center, textColor: Colors.red, fontWeight: FontWeight.normal),
              FLText.displaySmall('Hello World', textAlign: TextAlign.center, textColor: Colors.red, fontWeight: FontWeight.normal),
              FLText.headlineLarge('Hello World', textAlign: TextAlign.center, textColor: Colors.red, fontWeight: FontWeight.normal),
              FLText.headlineMedium('Hello World', textAlign: TextAlign.center, textColor: Colors.red, fontWeight: FontWeight.normal),
              FLText.headlineSmall('Hello World', textAlign: TextAlign.center, textColor: Colors.red, fontWeight: FontWeight.normal),
              FLText.titleLarge('Hello World', textAlign: TextAlign.center, textColor: Colors.red, fontWeight: FontWeight.normal),
              FLText.titleMedium('Hello World', textAlign: TextAlign.center, textColor: Colors.red, fontWeight: FontWeight.normal),
              FLText.titleSmall('Hello World', textAlign: TextAlign.center, textColor: Colors.red, fontWeight: FontWeight.normal),
              FLText.bodyLarge('Hello World', textAlign: TextAlign.center, textColor: Colors.red, fontWeight: FontWeight.normal),
              FLText.bodyMedium('Hello World', textAlign: TextAlign.center, textColor: Colors.red, fontWeight: FontWeight.normal),
              FLText.bodySmall('Hello World', textAlign: TextAlign.center, textColor: Colors.red, fontWeight: FontWeight.normal),
              FLText.labelLarge('Hello World', textAlign: TextAlign.center, textColor: Colors.red, fontWeight: FontWeight.normal),
              FLText.labelMedium('Hello World', textAlign: TextAlign.center, textColor: Colors.red, fontWeight: FontWeight.normal),
              FLText.labelSmall('Hello World', textAlign: TextAlign.center, textColor: Colors.red, fontWeight: FontWeight.normal),
            ],
          ),
        ),
      ),
    );
  }
}
