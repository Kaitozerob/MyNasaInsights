import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mynasainsights/core/constants/app_constants.dart';
import 'package:mynasainsights/feature/insights/presentation/widgets/insight_card.dart';
import 'package:mynasainsights/feature/insights/presentation/pages/detail_page.dart';

class ShowDataPage extends StatefulWidget {
  const ShowDataPage({super.key});

  @override
  State<ShowDataPage> createState() => _ShowDataPageState();
}

class _ShowDataPageState extends State<ShowDataPage> {
  late Future<List<dynamic>> apiData;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    apiData = fetchApiData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Método para consumir el API
  Future<List<dynamic>> fetchApiData() async {
    const url = AppConstants.apodBaseUrl;
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data is List) {
        return data;
      } else {
        throw Exception("El formato de los datos no es una lista");
      }
    } else {
      throw Exception("Error al obtener datos del API: ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mostrar Datos"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FutureBuilder<List<dynamic>>(
          future: apiData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Pantalla de carga del michi owo
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/images/loading.gif',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Fetching amazing data...',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return Stack(
                children: [
                  buildDataDisplay(snapshot.data!),
                  // Solo mostramos el FloatingActionButton cuando hay datos jeje
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: FloatingActionButton(
                      onPressed: () {
                        _scrollController.animateTo(
                          0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      tooltip: 'Volver al inicio',
                      child: const Icon(Icons.arrow_upward),
                      backgroundColor: Colors.blueAccent,
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: Text("No hay datos disponibles"));
            }
          },
        ),
      ),
    );
  }

  Widget buildDataDisplay(List<dynamic> data) {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final item = data[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: InsightCard(
            title: item['title'] ?? "Sin título",
            imageUrl: item['url'] ?? '',
            date: item['date'] ?? "No disponible",
            description: item['explanation'] ?? "Sin descripción",
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      DetailPage(
                        title: item['title'] ?? "Sin título",
                        imageUrl: item['url'] ?? '',
                        date: item['date'] ?? "No disponible",
                        explanation: item['explanation'] ?? "Sin descripción",
                      ),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}