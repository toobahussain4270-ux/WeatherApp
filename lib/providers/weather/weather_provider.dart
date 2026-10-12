import 'package:flutter/material.dart';
import 'package:weather_app/data/models/current_model.dart';
import 'package:weather_app/data/models/location_model.dart';
import 'package:weather_app/data/models/repository/weather_repo.dart';

import '../../data/models/current_weather_response.dart';

class WeatherProvider with ChangeNotifier{
  WeatherRepo repo;
  bool loading = false;
  LocationModel? location;
  CurrentModel? current;

  WeatherProvider(this.repo);



  Future<void> getCurrentWeather(String city)async{
    loading =true;
    notifyListeners();
    CurrentWeatherResponse? res =  await repo.getCurrentWeather(city);
    print(res);
    if(res != null){
      location =res.location;
      current = res.current;

    }
    loading = false;
    notifyListeners();
  }

}