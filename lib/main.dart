import 'package:blog_app/views/splash.dart';
import 'package:blog_app/views/theme.dart';
import 'package:flutter/material.dart';

void main() {
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
