import 'package:flutter/material.dart';
import 'package:mynasainsights/feature/insights/presentation/pages/favorites_page.dart';
import 'package:mynasainsights/feature/insights/presentation/pages/show_data_page.dart';
import 'package:mynasainsights/shared/presentation/pages/home_page.dart';

void main() {
  runApp(const MyNasaInsightsApp());
}

class MyNasaInsightsApp extends StatelessWidget {
  const MyNasaInsightsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyNasaInsights',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/show-data': (context) => const ShowDataPage(),
        '/favorites': (context) => const FavoritesPage(),
      },
    );
  }
}