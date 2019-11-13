import 'dart:async';
import 'package:meta/meta.dart';
import 'models/models.dart';

class WeatherRepository {
  Future<Weather> getWeather({@required String city}) async {
    await Future.delayed(Duration(seconds: 1));
    return Weather(
      temperature: 30,
      condition: Condition.sunny,
    );
  }
}
