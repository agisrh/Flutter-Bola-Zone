enum Environment { dev, staging, production }

class Env {
  static Environment environment = Environment.dev;
  static String appName = "Bola Zone";

  static String baseUrl({String version = 'v1'}) {
    switch (environment) {
      case Environment.production:
        return "https://ligaindonesia-api.vercel.app/api/$version/";
      case Environment.staging:
        return "https://ligaindonesia-api.vercel.app/api/$version/";
      default:
        return "https://ligaindonesia-api.vercel.app/api/$version/";
      //return "http://192.168.1.72:8000/api/$version/";
    }
  }
}
