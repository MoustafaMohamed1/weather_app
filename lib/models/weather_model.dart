class WeatherModel {
  final String cityName;
  final DateTime date;
  final String? image;
  final double minTemp;
  final double maxTemp;
  final String weatherCondition;
  final double temp;
  WeatherModel(
      {required this.temp,
        required this.cityName,
      required this.date,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherCondition,
      this.image});
  factory WeatherModel .fromJson(json){
    return WeatherModel(image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
        cityName: json['location']['name'],
        date: DateTime.parse(json['current']['last_updated']),
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        weatherCondition: json['forecast']['forecastday'][0]['day']['condition']['text'],
temp: json['forecast']['forecastday'][0]['day']['avgtemp_c']
    );
  }
}
