import 'package:flutter/material.dart';
import 'package:news_flutter/News.dart';
import 'package:news_flutter/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencis();
  runApp(const News());
}
