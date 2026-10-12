import 'package:flutter/material.dart';
import 'package:weather_app/data/models/forecast_day_model.dart';
import 'package:weather_app/screens/forecast/widgets/items_hourly_update.dart';


class ItemsForecastDay extends StatelessWidget {
  final ForecastDayModel forecastDay;
  const ItemsForecastDay({super.key, required this.forecastDay});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade50,
      margin: EdgeInsets.symmetric(vertical: 10),
      child:Column(
        children: [
          ListTile(
            title: Text('Date'),
            trailing: Text(forecastDay.date?? ''),
          ),
          ListTile(
            title: Text('Condition'),
            trailing: Text(forecastDay.day?.condition?.text?? ''),
            leading: Image.network(
              forecastDay.day?.condition?.icon?.replaceFirst('//','https://')?? ''
            ),
          ),
          ListTile(
            title: Text('Max Temperature (c)'),
            trailing: Text(forecastDay.day?.maxtempC.toString()?? ''),
          ),
          ListTile(
            title: Text('Min Temperature (c)'),
            trailing: Text(forecastDay.day?.mintempC.toString()?? ''),
          ),
          ListTile(
            title: Text('Sun Set'),
            trailing: Text(forecastDay.astro?.sunset?? ''),
          ),
          ListTile(
            title: Text('Sun Rise'),
            trailing: Text(forecastDay.astro?.sunrise?? ''),
          ),
          Divider(),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for(var hour in forecastDay.hour?? [])
                  ItemsHourlyUpdate(hour: hour)
              ],
            ),
          )
        ],
      )
    );
  }
}
