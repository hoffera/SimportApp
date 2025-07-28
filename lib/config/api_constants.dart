class ApiConstants {
  static const String baseUrl =
      'https://687fa87cefe65e52008a8cfe.mockapi.io/api/v1';

  static String getClients() => '$baseUrl/clients';

  static String getView(String id) => '$baseUrl/view/$id';
}
