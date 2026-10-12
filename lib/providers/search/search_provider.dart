import 'package:flutter/material.dart';
import 'package:weather_app/data/models/repository/weather_repo.dart';
import 'package:weather_app/data/models/search_model.dart';

class SearchProvider with ChangeNotifier{
  WeatherRepo repo;
  List<SearchModel> items = [];
  bool loading = false;

  SearchProvider(this.repo);

  searchRegion(String city)async{
    loading = true;
    notifyListeners();
   items =await repo.searchRegions(city);
   loading = false;
   notifyListeners();
  }

}