class URLConfiguration {
  static const baseUrl = 'https://api.stagingcupid.com/api/v1';

  static const countryUrl = '$baseUrl/countries';
  static const xApiKey = 'sA,{tzUD=]dHvYNBJ4xVZ3c=&zS%.UqVc{But?kc';
  static const userAgent = 'com.stagingcupid.api/10.16.6 (Release) Android/31';

  static const Map<String, String> headers = {
    'X-API-Key': xApiKey,
    'User-Agent': userAgent,
  };
}
