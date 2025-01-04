import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String date;
  final String explanation;

  const DetailPage({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.date,
    required this.explanation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalles"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen principal con efecto de overlay
            Stack(
              children: [
                Image.network(
                  imageUrl,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.broken_image, size: 300, color: Colors.grey);
                  },
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Contenido principal
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Fecha estilizada
                  Text(
                    "Fecha: $date",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Descripción
                  Text(
                    explanation,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),

            // Botón "Guardar en Favoritos"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Añadido a Favoritos")),
                  );
                },
                icon: const Icon(Icons.favorite),
                label: const Text("Guardar en Favoritos"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}