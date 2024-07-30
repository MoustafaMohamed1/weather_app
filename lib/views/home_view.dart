import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wweatherr/main.dart';
import 'package:wweatherr/views/search_view.dart';
import 'package:wweatherr/views/weather_info_body.dart';

import '../cubits/get_weather_cubit/get_weather_cubit.dart';
import '../cubits/get_weather_cubit/get_weather_state.dart';
import 'no_weather_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherState>(
      builder: (context, state) {
        Color appBarColor = Colors.blue;
        if (state is WeatherLoadedState) {
          appBarColor = getThemeColor(state.weatherModel.weatherCondition);
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: appBarColor,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SearchView();
                  }));
                },
                icon: Icon(
                  Icons.search,
                  size: 30,
                ),
              )
            ],
            title: const Text(
              'Weather App',
              style: TextStyle(),
            ),
          ),
          body: state is WeatherInitialState
              ? NoWeatherBody()
              : state is WeatherLoadedState
              ? WeatherInfoBody(
            weather: state.weatherModel,
          )
              : Text('Oops, there was an error'),
        );
      },
    );
  }
}
