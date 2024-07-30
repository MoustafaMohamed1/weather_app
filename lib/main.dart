import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wweatherr/views/home_view.dart';

import 'cubits/get_weather_cubit/get_weather_cubit.dart';
import 'cubits/get_weather_cubit/get_weather_state.dart';
void main(){
  runApp(WeatherApp());
}
class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              MaterialColor themeColor = Colors.blue;


              if (state is WeatherLoadedState) {
                themeColor = getThemeColor(state.weatherModel.weatherCondition);
              }


              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primarySwatch: themeColor,
                ),
                home: HomeView(),
              );
            },
          );
        },
      ),
    );
  }
}

MaterialColor getThemeColor(String? weatherCondition) {

  if (weatherCondition == null) {
    return Colors.blue;
  }
  switch (weatherCondition.toLowerCase()) {
    case 'sunny':
      return Colors.yellow;
    case 'partly cloudy':
    case 'overcast':
    case 'blizzard':
      return Colors.blueGrey;
    case 'cloudy':
    case 'fog':
      return Colors.grey;
    case 'freezing fog':
    case 'light rain shower':
    case 'blowing snow':
    case 'light snow':
    case 'light snow showers':
    case 'mist':
    case 'patchy rain possible':
      return Colors.lightBlue;
    case 'patchy light rain':
    case 'light rain':
    case 'patchy moderate snow':
    case 'moderate or heavy snow showers':
    case 'moderate snow':
    case 'moderate rain at times':
    case 'moderate rain':
    case 'moderate or heavy rain shower':
    case 'patchy light drizzle':
    case 'light drizzle':
    case 'patchy snow possible':
      return Colors.blue;
    case 'patchy heavy snow':
    case 'heavy snow':
    case 'torrential rain shower':
    case 'heavy rain at times':
    case 'heavy rain':
      return Colors.indigo;
    case 'light sleet showers':
    case 'moderate or heavy sleet showers':
    case 'moderate or heavy showers of ice pellets':
    case 'light snow showers':
    case 'light showers of ice pellets':
    case 'ice pellets':
    case 'light freezing rain':
    case 'moderate or heavy freezing rain':
    case 'light sleet':
    case 'moderate or heavy sleet':
    case 'patchy light snow':
    case 'freezing drizzle':
    case 'heavy freezing drizzle':
    case 'patchy sleet possible':
    case 'patchy freezing drizzle possible':
      return Colors.cyan;
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
    case 'moderate or heavy snow with thunder':
    case 'patchy light snow with thunder':
    case 'thundery outbreaks possible':
    case 'patchy rain nearby':
      return Colors.deepPurple;
    default:
      return Colors.grey; // Default color for unrecognized conditions
  }

}
