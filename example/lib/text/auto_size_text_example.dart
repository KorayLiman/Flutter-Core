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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FLAutoSizeText(
                'A long long text' * 10,
                minFontSize: 8,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              verticalBox20,
              FLAutoSizeText.rich(
                TextSpan(
                  text: 'A long long text' * 10,
                  children: [
                    TextSpan(
                      text: 'A long long text' * 10,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ],
                ),
                minFontSize: 10,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              verticalBox24,
              const SizedBox(
                width: 170,
                height: 100,
                child: FLAutoSizeText(
                  'A looonnnngggtext1123tttttttttt qweqeqqwe12313123qwe',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
