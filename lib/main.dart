import 'package:blog_app/views/splash.dart';
import 'package:blog_app/views/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const BlogApp());
}

class BlogApp extends StatelessWidget {
  const BlogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'onPost',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.customTheme,
      home: const SplashPage(),
    );
  }
}
