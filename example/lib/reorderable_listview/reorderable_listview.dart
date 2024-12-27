import 'package:flcore/flcore.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: ReorderableListViewExample(),
    ),
  );
}

class ReorderableListViewExample extends StatefulWidget {
  const ReorderableListViewExample({super.key});

  @override
  State<ReorderableListViewExample> createState() => _ReorderableListViewExampleState();
}

class _ReorderableListViewExampleState extends State<ReorderableListViewExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reorderable ListView Example')),
      body: FLSingleChildScrollView(
        onRefresh: () async {
          await 2.seconds.future;
        },
        child: Row(
          children: [
            Expanded(
              child: FLReorderableListView(
                onReorder: (int oldIndex, int newIndex) {},
                physics: const NeverScrollableScrollPhysics(),
                onReachedEnd: () async {
                  await 2.seconds.future;
                },
                children: [
                  ...List.generate(
                    100,
                    (index) => ListTile(
                      key: ValueKey(index),
                      title: Text('$index'),
                      trailing: const Icon(Icons.drag_handle),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: FLReorderableListView(
                onReorder: (int oldIndex, int newIndex) {},
                onReachedEnd: () async {
                  await 2.seconds.future;
                },
                onRefresh: () async {
                  await 2.seconds.future;
                },
                children: List.generate(
                  100,
                  (index) => ListTile(
                    key: ValueKey(index),
                    title: Text('$index'),
                    trailing: const Icon(Icons.drag_handle),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FLReorderableListView.builder(
                onReorder: (int oldIndex, int newIndex) {},
                padding: const EdgeInsets.symmetric(vertical: 24),
                onReachedEnd: () => 5.seconds.future,
                onRefresh: () => 2.seconds.future,
                itemBuilder: (context, index) {
                  return ListTile(
                    key: ValueKey(index),
                    title: Text('$index'),
                    trailing: const Icon(Icons.drag_handle),
                  );
                },
                itemCount: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
