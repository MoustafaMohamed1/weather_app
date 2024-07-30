import 'package:dio/dio.dart';

import '../models/weather_model.dart';


class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '3677bed892474b30b7a122242220806';
  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1',
      );
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {

      final String errorMesaage = e.response?.data['error']['message'] ??
          'oops there was an error please try later';
      throw Exception(errorMesaage);
    } catch (e) {
      throw Exception('oops there was an error please try later');
    }
  }
}
