import 'package:flutter/material.dart';
import 'package:weather_app/data/models/current_model.dart';
import 'package:weather_app/data/models/current_weather_response.dart';
import 'package:weather_app/data/models/location_model.dart';
import 'package:weather_app/data/models/repository/weather_repo.dart';

class HomeProvider with ChangeNotifier{
  WeatherRepo repo;
  LocationModel? location;
  CurrentModel? current;
  bool loading = false;

  HomeProvider(this.repo){
    getCurrentWeather('Lahore');
  }


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