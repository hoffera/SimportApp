class AuthConstants {
  static const String baseUrl = "http://172.25.120.14:4000";

  static const String loginEndpoint = "/v1/creator/login";

  static const String loginUrl = "$baseUrl$loginEndpoint";

  static const int connectionTimeout = 10;

  static const int receiveTimeout = 10;

  static const Map<String, String> defaultHeaders = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };
}
