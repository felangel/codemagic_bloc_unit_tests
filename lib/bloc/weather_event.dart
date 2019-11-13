import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class WeatherRequested extends WeatherEvent {
  final String city;

  const WeatherRequested({@required this.city});

  @override
  List<Object> get props => [city];
}
