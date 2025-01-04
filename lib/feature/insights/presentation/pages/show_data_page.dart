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

  @override
  void initState() {
    super.initState();
    apiData = fetchApiData();
  }

  // Método para consumir el API
  Future<List<dynamic>> fetchApiData() async {
    const url = AppConstants.apodBaseUrl;
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data is List) {
        return data; // Convertimos explícitamente a lista
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
      body: FutureBuilder<List<dynamic>>(
        future: apiData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return buildDataDisplay(snapshot.data!);
          } else {
            return const Center(child: Text("No hay datos disponibles"));
          }
        },
      ),
    );
  }

  Widget buildDataDisplay(List<dynamic> data) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final item = data[index];
        return InsightCard(
          title: item['title'] ?? "Sin título",
          imageUrl: item['url'] ?? '',
          date: item['date'] ?? "No disponible",
          description: item['explanation'] ?? "Sin descripción",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  title: item['title'] ?? "Sin título",
                  imageUrl: item['url'] ?? '',
                  date: item['date'] ?? "No disponible",
                  explanation: item['explanation'] ?? "Sin descripción",
                ),
              ),
            );
          },
        );
      },
    );
  }
}