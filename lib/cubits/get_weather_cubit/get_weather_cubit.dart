
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../../models/weather_model.dart';
import '../../searvice/weather_searvice.dart';
import 'get_weather_state.dart';


class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
 WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
  weatherModel  = await WeatherService(Dio())
      .getCurrentWeather(cityName: cityName);
  emit(WeatherLoadedState(weatherModel!));
  }catch(e){
    emit(WeatherFailuerState(e.toString()));
  }
  }

}