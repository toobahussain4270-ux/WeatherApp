import 'package:flutter/material.dart';
import 'package:weather_app/data/models/hour_model.dart';
class ItemsHourlyUpdate extends StatelessWidget {
  final HourModel hour;
  const ItemsHourlyUpdate({super.key, required this.hour});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          Image.network(hour.condition?.icon?.replaceFirst('//', 'https://')?? ''),
          Text('${hour.tempC}c'),
          Text(hour.time?? '',style: Theme.of(context).textTheme.bodySmall,)
        ],
      ),
    );
  }
}
