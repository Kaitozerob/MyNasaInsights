class AppConstants {
  // Base URL de la API de NASA
  static const String baseUrl = 'https://api.nasa.gov';

  // Endpoint específico para APOD
  static const String apodBaseUrl =
      '$baseUrl/planetary/apod?start_date=2017-07-08&end_date=2017-12-10&api_key=0m1V1EVsa76rFO2yrZhFy945tpfI4x60aDh95J9w';

  // Endpoint específico para Mars Rover Photos
  static const String marsBaseUrl =
      '$baseUrl/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=0m1V1EVsa76rFO2yrZhFy945tpfI4x60aDh95J9w';

  // Tiempo de espera global para las solicitudes (en segundos)
  static const int timeoutDuration = 30;
}