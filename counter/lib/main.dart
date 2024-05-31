import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './app/app.dart';

void main() {
  runApp(
    const ProviderScope(child: const App()),
  );
}
