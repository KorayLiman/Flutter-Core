import 'package:flcore/flcore.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(
    const MaterialApp(
      home: ListViewExample(),
    ),
  );
}

class ListViewExample extends StatefulWidget {
  const ListViewExample({super.key});

  @override
  State<ListViewExample> createState() => _ListViewExampleState();
}

class _ListViewExampleState extends State<ListViewExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Example'),
      ),
      body: FLSingleChildScrollView(
        onRefresh: () async {
          await 2.seconds.future;
        },
        child: Row(
          children: [
            Expanded(
              child: FLListView(
                physics: const NeverScrollableScrollPhysics(),
                onReachedEnd: () async {
                  await 5.seconds.future;
                },
                children: [
                  ...List.generate(100, (index) => const ListTile(title: Text('Item'))),
                ],
              ),
            ),
            Expanded(
              child: FLListView(
                onReachedEnd: () async {
                  await 5.seconds.future;
                },
                onRefresh: () async {
                  await 2.seconds.future;
                },
                children: List.generate(
                  100,
                  (index) => ListTile(
                    title: Text('Item $index'),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FLListView.separated(
                padding: const EdgeInsets.all(24),
                onReachedEnd: () => 5.seconds.future,
                onRefresh: () => 2.seconds.future,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
