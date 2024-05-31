import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appbarProvider = Provider<String>((ref) {
  return 'Counter';
});

final counterProvider = StateProvider<int>((ref) {
  return 1;
});

class CounterView extends ConsumerWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ref.read(appbarProvider)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              ref.watch(counterProvider).toString(),
              style: const TextStyle(
                fontSize: 200,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
              child: FloatingActionButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).state--;
                },
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 80.0, bottom: 16.0),
              child: FloatingActionButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).state++;
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
